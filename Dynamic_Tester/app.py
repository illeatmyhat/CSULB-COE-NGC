import sys
from os import listdir
from os.path import isfile, join
from google.protobuf import text_format
import numpy as np
import caffe
from caffe.proto import caffe_pb2

from PyQt5.QtCore import QUrl
from PyQt5.QtQuick import QQuickView
from PyQt5.QtQml import qmlRegisterType, QQmlComponent, QQmlApplicationEngine
from PyQt5.QtWidgets import QApplication

labels = ['Negative', 'Positive']

caffe.set_mode_cpu()
deploy_file = 'deploy.prototxt'
caffemodel  = 'snapshot_iter_13140.caffemodel'
mean_file = 'mean.binaryproto'
net = caffe.Net(deploy_file, caffemodel, caffe.TEST)

network = caffe_pb2.NetParameter()
with open(deploy_file) as infile:
    text_format.Merge(infile.read(), network)
dims = network.input_shape[0].dim

transformer = caffe.io.Transformer(inputs={'data': dims})
transformer.set_transpose('data', (2,0,1))
transformer.set_raw_scale('data', 255)
transformer.set_channel_swap('data', (2,1,0))

# set mean pixel
with open(mean_file, 'rb') as infile:
    blob = caffe_pb2.BlobProto()
    blob.MergeFromString(infile.read())
    if blob.HasField('shape'):
        blob_dims = blob.shape
    elif blob.HasField('num') and blob.HasField('channels') and \
            blob.HasField('height') and blob.HasField('width'):
        blob_dims = (blob.num, blob.channels, blob.height, blob.width)
    else:
        raise ValueError('blob does not provide shape or 4d dimensions')
    pixel = np.reshape(blob.data, blob_dims[1:]).mean(1).mean(1)
    transformer.set_mean('data', pixel)

sys_argv = sys.argv
sys_argv += ['--style', 'material']
app = QApplication(sys.argv)


# Create a QML engine.
engine = QQmlApplicationEngine()
engine.load(QUrl('main.qml'))
win = engine.rootObjects()[0]
win.show()
sys.exit(app.exec_())
