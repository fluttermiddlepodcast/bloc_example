# bloc_example

![GitHub Actions](https://github.com/fluttermiddlepodcast/bloc_example/actions/workflows/flutter.yaml/badge.svg)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/c2980a7a10754a23bb6cae75dc767991)](https://app.codacy.com/gh/fluttermiddlepodcast/bloc_example/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)

Небольшой проект для демонстрации возможностей [bloc](https://pub.dev/packages/bloc)
и [flutter_bloc](https://pub.dev/packages/flutter_bloc).

## Материалы из репозитория

### Основы

- [Flutter Developer Talks #12 - BLoC](https://podcasts.apple.com/ru/podcast/flutter-developer-talks/id1648922484?i=1000644267848)
- [Flutter Developer Learn #1 - Дополнение к выпуску про базу BLoC](https://t.me/fluttermiddlepodcast/173)
- [Flutter Developer Learn #2 - BlocBuilder](https://youtu.be/98iF13KKdss)
- [Flutter Developer Learn #3 - Реализация состояний в BLoC](https://youtu.be/YBLzMV9dVmI)
- [Flutter Developer Learn #4 - BlocListener](https://t.me/fluttermiddlepodcast/277)
- [Flutter Developer Learn #5 - Cubit](https://t.me/fluttermiddlepodcast/279)
- [Flutter Developer Learn #8 - Как не нужно выстраивать коммуникацию между блоками](https://t.me/fluttermiddlepodcast/300)
- [Flutter Developer Learn #10 - BlocConsumer 2](https://t.me/fluttermiddlepodcast/338)

### Продакшн

- [Flutter Developer Learn #6 - feature-first и layer-first подходы для организации Flutter-проектов](https://t.me/fluttermiddlepodcast/281)
- [bloc_concurrency](https://t.me/fluttermiddlepodcast/379)
- [Шиммеры / Скелетоны](https://t.me/fluttermiddlepodcast/391)
- [bloc + пагинация = ❤️](https://t.me/fluttermiddlepodcast/421)
- [hydrated_bloc: сохраняем состояние блоков](https://t.me/fluttermiddlepodcast/426)
- [replay_bloc: откатываем состояния блоков и кубитов](https://t.me/fluttermiddlepodcast/427)
- [BlocObserver](https://t.me/fluttermiddlepodcast/474)

### Тулинг

- [Flutter Developer Learn #7 - Генерация шаблонного кода / mason](https://t.me/fluttermiddlepodcast/297)
- [bloc_tools: генерируем блоки из консоли](https://t.me/fluttermiddlepodcast/423)
- [bloc_lint](https://t.me/fluttermiddlepodcast/461)

### Тесты

- [bloc_test](https://t.me/fluttermiddlepodcast/463)
- [Тестирование с моками и фейками](https://t.me/fluttermiddlepodcast/470)

### Полезное

- [flutter_bloc на собеседованиях](https://t.me/fluttermiddlepodcast/282)
- [VS Code для разработки Flutter-приложений](https://t.me/fluttermiddlepodcast/327)

## Запуск

### fvm

В проекте используется [fvm](https://fvm.app/) в качестве менеджера версий Флаттера.
[fvm_config.json](./.fvm/fvm_config.json) содержит в себе актуальный конфиг.

<u>Во время настройки проекта выполните:</u>

```shell
fvm use
```

### Без fvm

В [fvm_config.json](./.fvm/fvm_config.json) указана версия Флаттера, которую необходимо установить для работы с
проектом. Сделать это можно любым удобным для вас способом, но лучше использовать [fvm](https://fvm.app/).

### Запуск

Дополнительных параметров не требуется. Проект запускается либо через `fvm flutter run`, либо через кнопку в IDE /
редакторе кода.

## Обратная связь

- Email: fluttermiddlepodcast@gmail.com
