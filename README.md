Лабораторная работа 4.  
====
# Немного информации о цели лабараторной работы
Исследовать влияние различных техник аугментации данных на процесс обучения нейронной сети на примере решения задачи классификации Oregon Wildlife с использованием техники обучения Transfer Learning. В данной работе использовалась нейронная сеть EfficientNet-B0, предобученная  на базе изображений ImageNet с использованием политики изменения темпа обучения - Экспоненциальное затухание (Exponential Decay) с параметрами initial_lrate = 0.01 и k = 0.25. 

Аугментация данных — это важный этап обучения моделей машинного обучения. Под аугментацией данных понимается увеличение выборки данных для обучения через модификацию существующих данных.

В данной лабораторной работе использовались техники аугментации данных:
 -Манипуляции с яркостью и контрастом
 -Поворот изображения на случайный угол
 -Использование случайной части изображения
 -Добавление случайного шума
 
 * Для упрощения анализа результатов, будем сравнивать их с резульататми полученными при обучении нейронной сети EfficientNet-B0 без аугментации данных.
 
  ### Графики обучения для предобученной нейронной сети EfficientNet-B0 с политикой изменения темпа обучения - экспоненциальное затухание
 

 ***График метрики точности:*** 
<img src="./graph/epoch_categorical_accuracy_main.svg">

 ***График функции потерь::*** 
 
<img src="./graph/epoch_loss_main.svg">

### Анализ результатов:
- точности в конце обучения = 87.95%
- значение потерь в конце обучения = 0.326
 

# С использованием техники обучения Transfer Learning и оптимальной политики изменения темпа обучения обучить нейронную сеть EfficientNet-B0 (предварительно обученную на базе изображений imagenet) для решения задачи классификации изображений Oregon WildLife с использованием следующих техник аугментации данных:
 
### Манипуляции с яркостью и контрастом

* Функции изменения контраста, где image - входное изображение, 0.5  - множитель для регулировки контраста (contrast_factor).
```
def contrast(image, label):  
  return tf.image.adjust_contrast(image, 0.5), label
```

* Функции изменения яркости, где image - входное изображение, delta = 0.1  - число добавляемое к значениям пикселей.
```
def brightness(image, label):
  return tf.image.adjust_brightness(image, delta=0.1),label
```

* Вызов функции производился в TFRecordDataset:
```
return tf.data.TFRecordDataset(filenames)\
    .....
    .map(contrast)\
    .map(brightness)\
    ....

```

* Использовались следующии параметры:
```
  contrast_factor = 0.5, delta = 0.5;
  contrast_factor = 2, delta = 0.1;
  contrast_factor = 2, delta = 0.25;
  contrast_factor = 2, delta = 0.5;
  contrast_factor = 4, delta = 0.1;
```

 ### Графики обучения для предобученной нейронной сети EfficientNet-B0 с манипуляции с яркостью и контрастом:
  
 ***График метрики точности:*** 
<img src="./graph/epoch_categorical_accuracy_b_c.svg">

***Пояснение:*** 
 
<img src="./graph/b_c_cat.jpg">

 ***График функции потерь:*** 
 
<img src="./graph/epoch_loss_b_c.svg">

 ***Пояснение:*** 
 
<img src="./graph/b_c_loss.jpg">


### Анализ результатов:
Исходя из графкиов можно сказать, что параметры contrast_factor = 2, delta = 0.25 - являются оптимальными. 
При использовании данных параметров удалось добиться значения точности равное 89.77%, значение функции потерь равное 0.2301.
По сравнению с политикой без аугментации данных:
- Увеличелось значение точности на 1,82%
- уменьшение значение функции потерь на 0,0959

### Поворот изображения на случайный угол

* Для поворота изображения на случайный угол  в архитектуру нейронной сети был добавлен следующий слой с параметром factor=(0, 0.25) - определяет диапазон из которого будет случайно выбран угол поворота. 
```
 x = tf.keras.layers.experimental.preprocessing.RandomRotation(factor=(0, 0.25))(inputs)
```


* Использовались следующии параметры:
```
  factor = (0, 0.5);
  factor = (0, 0.25);
  factor = (0, 0.1);
  factor = (0, 0.05);
  factor = (0, 0.025);
  factor = (0, 0.001);
```

 ### Графики обучения для предобученной нейронной сети EfficientNet-B0 с поворотом на случайный угол:
  
 ***График метрики точности:*** 
<img src="./graph/epoch_categorical_accuracy_r_r.svg">

***Пояснение:*** 
 
<img src="./graph/r_r_cat.jpg">

 ***График функции потерь:*** 
 
<img src="./graph/epoch_loss_r_r.svg">

 ***Пояснение:*** 
 
<img src="./graph/r_r_loss.jpg">


### Анализ результатов:
Исходя из графкиов можно сказать, что при использовании параметров factor = (0, 0.025) и factor = (0, 0.001) достигаются лучшие значения.
При использовании factor = (0, 0.025) удалось добиться значения точности равное 88.70%, значение функции потерь равное 0.3246.
При использовании factor = (0, 0.001) удалось добиться значения точности равное 88.34%, значение функции потерь равное 0.2892.
Но так как во втором случае слишком маленький угол поворота (меньше одного градуса), то будет считать factor = (0, 0.025) - оптимальными параметрами.
По сравнению с политикой без аугментации данных:
- Увеличелось значение точности на 0,75%
- уменьшение значение функции потерь на 0,0014

### Влияние режимов заполнения для поворота изображения на случайный угол

* Для поворота изображения на случайный угол  в архитектуру нейронной сети был добавлен следующий слой с параметрами factor=(0, 0.25) - определяет диапазон из которого будет случайно выбран угол поворота, fill_mode = 'nearest' - режим заполнения.
```
 x = tf.keras.layers.experimental.preprocessing.RandomRotation(factor=(0, 0.25), fill_mode = 'nearest')(inputs)
```


* Использовались следующии режимы:
```
 fill_mode = 'nearest'
 fill_mode = 'constant'
 fill_mode = 'wrap'
 fill_mode = 'reflect
```

 ### Графики обучения для предобученной нейронной сети EfficientNet-B0 с использование различных режимов заполнения при повороте изображения на случайный угол:
  
 ***График метрики точности:*** 
<img src="./graph/epoch_categorical_accuracy_mode.svg">

***Пояснение:*** 
 
<img src="./graph/mode_cat.jpg">

 ***График функции потерь:*** 
 
<img src="./graph/epoch_loss_mode.svg">

 ***Пояснение:*** 
 
<img src="./graph/mode_loss.jpg">


### Анализ результатов:
Исходя из графкиов можно сказать, что при использовании fill_mode = 'wrap'достигаются наилучшие результаты.
При использовании данного режим заполения удалось добиться значения точности равное 88.78%, значение функции потерь равное 0.3082.
Что оказалось, чем без использования режима заполнения:
- Увеличелось значение точности на 0,08%
- уменьшение значение функции потерь на 0,0164


### Использование случайной части изображения

* Для поворота изображения на случайный угол  в архитектуру нейронной сети был добавлен следующие слои:
```
 x = tf.keras.layers.experimental.preprocessing.Resizing(height = 250, width = 250)(inputs)  
x = tf.keras.layers.experimental.preprocessing.RandomCrop(height = 224, width = 224)(x)
```
* Первый слой Resizing используется для увеличения входного изображения до больших размеров, в соответствии с параметрами height = 250, width = 250.
* Второй слой RandomCrop для обрезки случайной части размером height = 224, width = 224. Этот слой не будет изменятся, так как нейронная сеть EfficientNet-B0 требует подавать на вход изображение размером 224x224.

* Использовались следующии параметры:
```
  Resizing(250,250)
  Resizing(275,275)
  Resizing(300,300)
  Resizing(350,350)
```

 ### Графики обучения для предобученной нейронной сети EfficientNet-B0 с использование случайной части изображения:
  
 ***График метрики точности:*** 
<img src="./graph/epoch_categorical_accuracy_crop.svg">

***Пояснение:*** 
 
<img src="./graph/crop_cat.jpg">

 ***График функции потерь:*** 
 
<img src="./graph/epoch_loss_crop.svg">

 ***Пояснение:*** 
 
<img src="./graph/crop_loss.jpg">


### Анализ результатов:
Исходя из графкиов можно сказать, что при использовании параметров Resizing(275,275) достигаются лучшие значения.
При использовании данных параметров удалось добиться значения точности равное 87.25%, значение функции потерь равное 0.2967.
По сравнению с политикой без аугментации данных:
- Уменьшилось значение точности на 0,70%
- уменьшение значение функции потерь на 0,0293

- точности в конце обучения = 87.95%
- значение потерь в конце обучения = 0.326
 
 
 ### Добавление случайного шума

* Для поворота изображения на случайный угол  в архитектуру нейронной сети был добавлен следующий слой с параметрами 0.01(stddev) - значение среднеквадратичного отклонения добавляемого шума.
```
 x = tf.keras.layers.GaussianNoise(0.01)(inputs)
```

* Использовались следующии параметры:
```
  stddev = 1; 
  stddev = 0.5;
  stddev = 0.1; 
  stddev = 0.05; 
  stddev = 0.025;
  stddev = 0.01;
```

 ### Графики обучения для предобученной нейронной сети EfficientNet-B0 с добавление случайного шума:
  
 ***График метрики точности:*** 
<img src="./graph/epoch_categorical_accuracy_noise.svg">

***Пояснение:*** 
 
<img src="./graph/noise_cat.jpg">

 ***График функции потерь:*** 
 
<img src="./graph/epoch_loss_noise.svg">

 ***Пояснение:*** 
 
<img src="./graph/noise_loss.jpg">


### Анализ результатов:
Исходя из графкиов можно сказать, что при использовании параметров stddev = 0.1;  достигаются лучшие значения.
При использовании данных параметров удалось добиться значения точности равное 88.89%, значение функции потерь равное 0.265.
По сравнению с политикой без аугментации данных:
- Уменьшилось значение точности на 0,94%
- уменьшение значение функции потерь на 0,0293

 ### Использованием оптимальных техник аугментации данных совместно

* В качестве оптимальных использовались следующии параметры:
```
  Манипуляции с яркостью и контрастом: contrast_factor = 2, delta = 0.25
  Поворот изображения на случайный угол: factor = 0.025
  Использование случайной части изображения: height = 275, width = 275
  Добавление случайного шума: stddev = 0.1
```

 ### Графики обучения для предобученной нейронной сети EfficientNet-B0 с добавление случайного шума:
  
 ***График метрики точности:*** 
<img src="./graph/epoch_categorical_accuracy_all.svg">

***Пояснение:*** 
 
<img src="./graph/all_cat.jpg">

 ***График функции потерь:*** 
 
<img src="./graph/epoch_loss_all.svg">

 ***Пояснение:*** 
 
<img src="./graph/all_loss.jpg">


### Анализ результатов:
Исходя из графкиов можно сказать, что при совместном использовании техник аугментации данных с оптимальными параметрами удалось улучшить значения.
При использовании данных параметров удалось добиться значения точности равное 88.76%, значение функции потерь равное 0.2895.
По сравнению с политикой без аугментации данных:
- Уменьшилось значение точности на 0,81%
- уменьшение значение функции потерь на 0,0365
