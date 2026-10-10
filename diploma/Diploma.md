# Итоговый проект модуля «Облачная инфраструктура. Terraform»

## Обратите внимание

Перед выполнением итогового проекта, мы рекомендуем вам выполнить все обязательные и дополнительные домашние задания модулей «Виртуализация и контейнеризация» и «Облачная инфраструктура. Terraform».
 

## Цель итогового проекта:

развернуть web-приложение для работы в облачной инфраструктуре Yandex Cloud.

**В результате выполнения итогового проекта вы:**

- получите опыт работы с облачной инфраструктурой Yandex Cloud
- примените принципы IaaC при работе с виртуальными машинами
- овладеете навыками развертывания и настройки веб-приложений
- выполните оркестрацию контейнеров с Docker Compose и Docker Swarm
- получите опыт работы с Terraform для управления инфраструктурой
- сможете включить созданное web-приложение в свое портфолио
 
## Сроки выполнения:

на выполнение этого проекта вам дается 7 дней. У вас есть 2 попытки на доработку итогового проекта.
 

## Чек-лист готовности к работе над проектом:

- изучен основной и дополнительный теоретический материал по модулям «Виртуализация и контейнеризация» и «Облачная инфраструктура. Terraform»
- выполнены все обязательные домашние задания модулей
 
## Инструменты и дополнительные материалы, которые пригодятся для выполнения задания:

- Docker
- Docker Compose
- Terraform
 
## Описание итогового проекта:

Задания итогового проекта охватывают полный цикл создания и настройки инфраструктуры, установку необходимых инструментов, сборку и развертывание приложения, а также хранение образов в реестре контейнеров.

**В рамках итогового проекта вы:**

1. Соберете простое web-приложение на основании представленных нами данных (с описанием Dockerfile, docker compose yml).
2. Настроите инфраструктуру в Yandex Cloud, используя Terraform.
3. Развернете приложение в облачной среде.
 
## Инструкция по выполнению итогового проекта:

Используя инструменты Docker, Docker Compose и Terraform, вам необходимо сделать следующее:
 

**Задание 1.** Развертывание инфраструктуры в Yandex Cloud.

- Создайте Virtual Private Cloud (VPC).
- Создайте подсети.
- Создайте виртуальные машины (VM):
  - Настройте группы безопасности (порты 22, 80, 443).
  - Привяжите группу безопасности к VM.
- Опишите создание БД MySQL в Yandex Cloud.
- Опишите создание Container Registry.

### Ответ к заданию 1

- Создана Virtual Private Cloud (VPC) (описание в файле [main.tf](https://github.com/world12hub/ter-homeworks/blob/diploma/diploma/main.tf)).

| Terraform-ресурс | Модуль | Имя ресурса | Что делает |
|:---|:---|:---|:---|
| `yandex_vpc_network` | [vpc](https://github.com/world12hub/ter-homeworks/tree/diploma/diploma/modules/vpc) | `main-network` | Создает облачную сеть | 

**Скриншот:**

<img width="910" height="138" alt="image" src="https://github.com/user-attachments/assets/96a2c978-2291-4a2a-991c-38eca6c86df0" />

- Создана подсеть (описание в файле [main.tf](https://github.com/world12hub/ter-homeworks/blob/diploma/diploma/main.tf)).

| Terraform-ресурс | Модуль | Имя ресурса | Что делает |
|:---|:---|:---|:---|
| `yandex_vpc_subnet` | [vpc](https://github.com/world12hub/ter-homeworks/tree/diploma/diploma/modules/vpc) | `main-network-subnet` | Создает подсеть | 

**Скриншот:**

<img width="721" height="110" alt="image" src="https://github.com/user-attachments/assets/1046d70c-78bf-4edb-aaf7-291b2362f9e3" />



- Создана виртуальной машины (VM) (описание в файле [main.tf](https://github.com/world12hub/ter-homeworks/blob/diploma/diploma/main.tf)):
  - Настроены группы безопасности (порты 22, 80, 443).
  - Привязана группа безопасности к VM.

| №| Terraform-ресурс | Модуль | Имя ресурса | Что делает |
|:---|:---|:---|:---|:---|
| 1 | `yandex_compute_instance` | [vm](https://github.com/world12hub/ter-homeworks/tree/diploma/diploma/modules/vm) | `dev-web-1` | Создает виртуальную машину | 
| 2 | `yandex_compute_image`|[vm](https://github.com/world12hub/ter-homeworks/tree/diploma/diploma/modules/vm)| `ubuntu-2004-lts` | Копирует образ на новый диск |
| 3 | `yandex_vpc_security_group`|[sg](https://github.com/world12hub/ter-homeworks/tree/diploma/diploma/modules/sg)| `web-sg` | Создает группу безопасности | 


**Скриншот:**

**1**

<img width="1621" height="155" alt="image" src="https://github.com/user-attachments/assets/41a6c4c3-9661-4276-be1e-5271d8b7052e" />

**2**
<img width="951" height="468" alt="image" src="https://github.com/user-attachments/assets/716f07c4-c8fd-4a48-ae19-64ba8880a548" />

**3**

<img width="879" height="328" alt="image" src="https://github.com/user-attachments/assets/7cf954d7-cc27-48e6-80ca-9bbb941527b2" />

- Создана БД MySQL в Yandex Cloud (описание в файле [main.tf](https://github.com/world12hub/ter-homeworks/blob/diploma/diploma/main.tf)).

| Terraform-ресурс | Модуль | Имя ресурса | Что делает |
|---|---|---|---|
| `yandex_mdb_mysql_cluster` | [mysql](https://github.com/world12hub/ter-homeworks/tree/diploma/diploma/modules/mysql) | `mysql-cluster` | Создание кластера MySQL |
| `yandex_mdb_mysql_database` | [mysql](https://github.com/world12hub/ter-homeworks/tree/diploma/diploma/modules/mysql) | sensitive value | Создание БД MySQL |
| `yandex_mdb_mysql_user` | [mysql](https://github.com/world12hub/ter-homeworks/tree/diploma/diploma/modules/mysql) | sensitive value | Создание пользователя БД MySQL |
 

**Скриншот:**

<img width="918" height="155" alt="image" src="https://github.com/user-attachments/assets/01fd7142-8040-46e9-a652-8075e696b3b9" />

- Cоздан Container Registry (описание в файле [main.tf](https://github.com/world12hub/ter-homeworks/blob/diploma/diploma/main.tf)).
 
| Terraform-ресурс | Модуль | Имя ресурса | Что делает |
|---|---|---|---|
| `yandex_container_registry` | [container_registry](https://github.com/world12hub/ter-homeworks/tree/diploma/diploma/modules/mysql) | app-registry | Создает Container Registry | 

**Скриншот:**

<img width="821" height="252" alt="image" src="https://github.com/user-attachments/assets/6d40667a-55eb-4116-b5fd-f3bfdf1ec94b" />

**Задание 2.** Используя user-data (cloud-init), установите Docker и Docker Compose (см. Задания 5 модуля «Виртуализация и контейнеризация»).

### Ответ к заданию 2

Используя user-data (cloud-init) (описание в файле [cloud-init.yml](https://github.com/world12hub/ter-homeworks/blob/diploma/diploma/cloud-init.yml), установлены Docker и Docker Compose

**Скриншот:**

Вывод команды `docker --version` и `docker compose version`.

<img width="408" height="78" alt="image" src="https://github.com/user-attachments/assets/64c6219f-c3e6-4c23-a0f4-9d78b58194fa" />

**Задание 3.** Опишите Docker файл (см. Задания 5 «Виртуализация и контейнеризация») c web-приложением и сохраните контейнер в Container Registry.

### Ответ к заданию 3

1. Описан Docker файл c web-приложением (описание в файле [Dockerfile.python](https://github.com/world12hub/ter-homeworks/edit/diploma/diploma/app/Dockerfile.python))
2. Cохранен контейнер c web-приложением в Container Registry.

**Выполнены следующие команды:**

**1.** Аутентификация в реестре

`yc iam create-token | docker login --username iam --password-stdin cr.yandex`

**2.** Сборка образа

`docker build -f Dockerfile.python -t cr.yandex/crp0p18l1l7840en4slg/app:latest .`

**3.** Push

`docker push cr.yandex/crp0p18l1l7840en4slg/app:latest`

**4.** Проверка:
   
`yc container image list --registry-id crp0p18l1l7840en4slg`

**Скриншот:**

<img width="1107" height="160" alt="image" src="https://github.com/user-attachments/assets/267f1957-6028-4b5f-9329-9397c8e71126" />

**Задание 4.** Завяжите работу приложения в контейнере на БД в Yandex Cloud.

### Ответ к заданию 4

Выполнены следующие команды:

1. Логин в Container Registry

`yc iam create-token | docker login --username iam --password-stdin cr.yandex`

2.  Скачивание образа из реестра

`docker pull cr.yandex/crp0p18l1l7840en4slg/app:/latest`

3. Запуск

docker compose up -d

**Скриншот:**

<img width="415" height="79" alt="image" src="https://github.com/user-attachments/assets/e6e4cd63-9877-41ba-b68f-932e32222273" />

**Web-страница:**

<img width="863" height="380" alt="image" src="https://github.com/user-attachments/assets/9336cf6b-d5fd-4f07-8b7a-fc3a3dbca1c3" />


**Задание 5***. Положите пароли от БД в LockBox и настройте интеграцию с Terraform так, чтобы пароль для БД брался из LockBox.
 

## Чек-лист готовности итоговой работы:

- инфраструктура в Yandex Cloud описана без хардкода, state хранится удаленно, подключен statelocking
- Docker и Docker Compose установлены через cloud-init
- Dockerfile включает мультисборку и сохранение образа в Container Registry
- приложения доступны по ip-адресу машины (в усложненном варианте - настроить DNS)
- создан MD-файл, который корректно оформлен и содержит примеры, скриншоты, ссылки
 
## Формат сдачи проекта:

1. Опишите проект в MD-файле, сформируйте ссылку и загрузите в Git репозиторий.
2. Вставьте ссылку на вашу работу в поле «Ссылка на решение» и нажмите «Отправить».
 
## Критерии оценивания итоговой работы:

**Зачёт**

Выполнены все задания:

- инфраструктура в Yandex Cloud создана и настроена корректно
- web-приложение развернуто и доступно через указанные порты
- Dockerfile и Docker Compose написаны правильно и применены для сборки и развертывания приложения
- образы сохранены в Container Registry
- виртуальные машины правильно настроены и управляются с помощью Terraform
- создан и корректно оформлен MD-файл
- код хранится в Git
  
**На доработку**

Инфраструктура нестабильная или приложение не работает:

- существуют проблемы с созданием инфраструктуры, установкой Docker, созданием Dockerfile или развертыванием приложения
- не удается запустить приложение или оно недоступно
- виртуальные машины не настроены или не управляются с помощью Terraform
- код содержит хардкод
- 
**Незачёт**

«Незачет» ставится в крайнем случае, если вы присылаете пустое или недоработанное задание во второй раз после отправки работы на доработку

## Удачи в выполнении заданий!

## Доработки 

**Замечания:**

Но один пункт чек-листа не выполнен совсем: нет remote state и state locking

### Ответ:

В файл [providers.tf](https://github.com/world12hub/ter-homeworks/edit/diploma/diploma/providers.tf) добавлен атрибут с **remote state** и **state locking**

---

ну и мелочь:

1. Хардкод. В вызовах модулей в main.tf захардкожены CIDR 10.0.1.0/24 (в двух местах), resource_preset_id, имена и размеры дисков. А в locals.tf лежат locals, которые нигде не используются.

### Ответ:

В [main.tf](https://github.com/world12hub/ter-homeworks/edit/diploma/diploma/main.tf) и [variables.tf](https://github.com/world12hub/ter-homeworks/edit/diploma/diploma/variables.tf) внесены соответствующие изменения. 

2. cloud-init. Ключ groups указан у пользователя дважды (sudo и docker). В YAML побеждает последний, так что в группу sudo пользователь не попадает. Нужно groups: [sudo, docker]

### Ответ:

В файл [cloud-init.yml](https://github.com/world12hub/ter-homeworks/edit/diploma/diploma/cloud-init.yml) у groups изменен ключ на [sudo, docker]


3. Деплой вручную. Приложение поднимается руками: login, pull, compose up, .env с паролем БД создаётся на ВМ вручную. Это допустимо. Но было бы красивее, если бы cloud-init сам клал compose.yaml и .env (пароль из random_password/переменной через templatefile) и поднимал контейнер.

### Ответ:

Не успел выполнить, так как занимает достаточно времени для решения данного пункта. Прошу понять и простить) 
