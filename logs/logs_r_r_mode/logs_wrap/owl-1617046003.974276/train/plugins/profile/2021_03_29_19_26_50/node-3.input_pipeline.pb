  *?C?l??@?"??^??@)      p=2|
EIterator::Model::MaxIntraOpParallelism::FiniteTake::Prefetch::BatchV2?3??@!1fJ2PP@)T?? *@1??TR?O@:Preprocessing2?
{Iterator::Model::MaxIntraOpParallelism::FiniteTake::Prefetch::BatchV2::MemoryCacheImpl::ParallelMapV2::FlatMap[0]::TFRecord??o{??
@!?U?f?@@)??o{??
@1?U?f?@@:Advanced file read2?
VIterator::Model::MaxIntraOpParallelism::FiniteTake::Prefetch::BatchV2::MemoryCacheImplA?,_????!+m????)?V?I???1nS?]Q)??:Preprocessing2?
eIterator::Model::MaxIntraOpParallelism::FiniteTake::Prefetch::BatchV2::MemoryCacheImpl::ParallelMapV2??t????!???????)??t????1???????:Preprocessing2s
<Iterator::Model::MaxIntraOpParallelism::FiniteTake::Prefetch???|@???!
dUs???)???|@???1
dUs???:Preprocessing2?
nIterator::Model::MaxIntraOpParallelism::FiniteTake::Prefetch::BatchV2::MemoryCacheImpl::ParallelMapV2::FlatMap???,?
@!t?2ǿ?@@)?hE,b??1c6?n????:Preprocessing2i
2Iterator::Model::MaxIntraOpParallelism::FiniteTake?Z?a/??!.??6J??)?%?<??1$??????:Preprocessing2?
RIterator::Model::MaxIntraOpParallelism::FiniteTake::Prefetch::BatchV2::MemoryCache?L?????!??[?G???)???Ss???1޻?]??:Preprocessing2]
&Iterator::Model::MaxIntraOpParallelism?E	?=??!?sҷ???)?X???F??1?.J??͵?:Preprocessing2F
Iterator::Model8??d?`??!ݘ4 ????)???U???1?'CR???:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysisk
unknownTNo step time measured. Therefore we cannot tell where the performance bottleneck is.no*noZno#You may skip the rest of this page.BZ
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown
  " * 2 : B J R Z b JGPUb??No step marker observed and hence the step time is unknown. This may happen if (1) training steps are not instrumented (e.g., if you are not using Keras) or (2) the profiling duration is shorter than the step time. For (1), you need to add step instrumentation; for (2), you may try to profile longer.