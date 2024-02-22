# Settins
Setting.destroy_all
Setting.create!(
  {
    main_title: "Современные автоматические угольные котлы",
    main_subtitle: "Производим и доставляем современные автоматические угольные котлы с сибирским характером со скидкой 15%",
    main_email: "sales.kotelsib@ya.ru",
    main_phone: "8 800 222-41-43",
    main_address: "Кузнецкий пр-т, 141/1",
    main_button_text: "выбрать котел",
    main_button_link: "/#catalog",

    block2_title: "О нас - В цифрах",
    block2_show: true,

    block3_title: "Каталог продукции",
    block3_show: true,
    block3_button_text: "получить консультацию",
    block3_button_link: "/#contacts",

    block4_title: "Отзывы",
    block4_show: true,
    block4_button_text: "заказать в 1 клик",
    block4_button_link: "/#",

    block5_title: "Почему нас рекомендуют друзьям и выбирают вот уже ... лет подряд",
    block5_show: true,

    block6_title: "Акции, подарки, бонусы",
    block6_show: true,
    block6_button_text: "и плюс ко всему...",
    block6_button_link: "/#support",

    block7_title: "Поддержка",
    block7_show: true,
    block7_button_text: "ваш вопрос?",
    block7_button_link: "/#contacts",

    contacts_title: "Контакты",
    contacts_show: true,
    contacts_map: '<script type="text/javascript" charset="utf-8" async src="https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3Af26020c5e0ae4b1b5e87d35c2afaa14d217bee2bf4af875c371a9e4a25053d32&amp;width=100%25&amp;height=500&amp;lang=ru_RU&amp;scroll=true"></script>',
    contacts_show_map: true
  }
)

puts "Настройки созданы"
# Settins End

# Activities
Activity.destroy_all
Activity.create!(
  [
    { info: "Квалифицированных профессионалов" },
    { info: "Собственное конструкторско - технологическое бюро" },
    { info: "Квалифицированных профессионалов" },
    { info: "Собственное конструкторско - технологическое бюро" },
    { info: "Квалифицированных профессионалов" },
    { info: "Собственное конструкторско - технологическое бюро" },
    { info: "Квалифицированных профессионалов" },
    { info: "Собственное конструкторско - технологическое бюро" }
  ]
).each do |activity|
  activity.icon.attach(
    io: File.open(File.join(Rails.root, "app/assets/images/about-icon.png")),
    filename: "about-icon.png"
  )
end

puts "Элементы 'О нас' созданы"
# Activities End

# Products
Product.destroy_all
Product.create!(
  [
    { title: "Котел ГЕЛИОС-12", old_price: 159500.0, price: 145500.0, description: "Котел ГЕЛИОС с автоматической подачей топлива состоит из теплообменника, шнекового механизма подачи топлива, факельной горелки, топливного бункера и контроллера управления.", sku: "BG001012", product_type: "Товар" },
    { title: "Котел ГЕЛИОС-12", old_price: 159500.0, price: 145500.0, description: "Котел ГЕЛИОС с автоматической подачей топлива состоит из теплообменника, шнекового механизма подачи топлива, факельной горелки, топливного бункера и контроллера управления.", sku: "BG001012", product_type: "Товар" },
    { title: "Котел ГЕЛИОС-12", old_price: 159500.0, price: 145500.0, description: "Котел ГЕЛИОС с автоматической подачей топлива состоит из теплообменника, шнекового механизма подачи топлива, факельной горелки, топливного бункера и контроллера управления.", sku: "BG001012", product_type: "Товар" },
    { title: "Котел ГЕЛИОС-12", old_price: 159500.0, price: 145500.0, description: "Котел ГЕЛИОС с автоматической подачей топлива состоит из теплообменника, шнекового механизма подачи топлива, факельной горелки, топливного бункера и контроллера управления.", sku: "BG001012", product_type: "Товар" },
    { title: "Котел ГЕЛИОС-12", old_price: 159500.0, price: 145500.0, description: "Котел ГЕЛИОС с автоматической подачей топлива состоит из теплообменника, шнекового механизма подачи топлива, факельной горелки, топливного бункера и контроллера управления.", sku: "BG001012", product_type: "Товар" },
    { title: "Котел ГЕЛИОС-12", old_price: 159500.0, price: 145500.0, description: "Котел ГЕЛИОС с автоматической подачей топлива состоит из теплообменника, шнекового механизма подачи топлива, факельной горелки, топливного бункера и контроллера управления.", sku: "BG001012", product_type: "Товар" },
    { title: "Котел ГЕЛИОС-12", old_price: 159500.0, price: 145500.0, description: "Котел ГЕЛИОС с автоматической подачей топлива состоит из теплообменника, шнекового механизма подачи топлива, факельной горелки, топливного бункера и контроллера управления.", sku: "BG001012", product_type: "Товар" },
    { title: "Котел ГЕЛИОС-12", old_price: 159500.0, price: 145500.0, description: "Котел ГЕЛИОС с автоматической подачей топлива состоит из теплообменника, шнекового механизма подачи топлива, факельной горелки, топливного бункера и контроллера управления.", sku: "BG001012", product_type: "Товар" }
  ]
).each do |product|
  product.image.attach(
    io: File.open(File.join(Rails.root, "app/assets/images/gelios-preview.png")),
    filename: "gelios-preview.png"
  )
end

puts "Товары созданы"
# Products End

# Services
Product.create!(
  [
    { title: "Монтаж и наладка котельного оборудования", old_price: 0.0, price: 0.0, description: "Производим монтаж котельного оборудования, пусконаладочные и ремонтные работы. Стоимость рассчитывается по согласованию проекта.", sku: "", product_type: "Услуга" },
    { title: "Монтаж и наладка котельного оборудования", old_price: 0.0, price: 0.0, description: "Производим монтаж котельного оборудования, пусконаладочные и ремонтные работы. Стоимость рассчитывается по согласованию проекта.", sku: "", product_type: "Услуга" },
    { title: "Монтаж и наладка котельного оборудования", old_price: 0.0, price: 0.0, description: "Производим монтаж котельного оборудования, пусконаладочные и ремонтные работы. Стоимость рассчитывается по согласованию проекта.", sku: "", product_type: "Услуга" },
    { title: "Монтаж и наладка котельного оборудования", old_price: 0.0, price: 0.0, description: "Производим монтаж котельного оборудования, пусконаладочные и ремонтные работы. Стоимость рассчитывается по согласованию проекта.", sku: "", product_type: "Услуга" },
  ]
).each do |product|
  product.image.attach(
    io: File.open(File.join(Rails.root, "app/assets/images/service-3.png")),
    filename: "service-3.png"
  )
end

puts "Услуги созданы"
# Services End

# Reviews
Review.destroy_all
Review.create!(
  [
    { name: "Иванов Иван Иванович", text: "3500 семей благодарны нам за тепло и уют, который создают наши котлы! 3500 семей благодарны нам за тепло и уют, который создают наши котлы", link: "https://vk.com/club149682984" },
    { name: "Иванов Иван Иванович", text: "3500 семей благодарны нам за тепло и уют, который создают наши котлы! 3500 семей благодарны нам за тепло и уют, который создают наши котлы", link: "https://vk.com/club149682984" },
    { name: "Иванов Иван Иванович", text: "3500 семей благодарны нам за тепло и уют, который создают наши котлы! 3500 семей благодарны нам за тепло и уют, который создают наши котлы", link: "https://vk.com/club149682984" },
    { name: "Иванов Иван Иванович", text: "3500 семей благодарны нам за тепло и уют, который создают наши котлы! 3500 семей благодарны нам за тепло и уют, который создают наши котлы", link: "https://vk.com/club149682984" },
  ]
).each do |review|
  review.avatar.attach(
    io: File.open(File.join(Rails.root, "app/assets/images/user.png")),
    filename: "user.png"
  )
end

puts "Отзывы созданы"
# Reviews End

# Advantages
Advantage.destroy_all
Advantage.create!(
  [
    { title: "Проектирование", description: "Как известно все познается в сравнении, посчитайте, сколько времени уходит на обслуживание «стандартного" },
    { title: "Производство", description: "Как известно все познается в сравнении, посчитайте, сколько времени уходит на" },
    { title: "Контроль качества", description: "Как известно все познается в сравнении, посчитайте, сколько времени уходит на готовую видеозапись...." },
    { title: "Хранение", description: "Как известно все познается в сравнении, посчитайте, сколько времени уходит на" },
    { title: "Логистика", description: "Как известно все познается в сравнении, посчитайте, сколько времени уходит на" },
    { title: "Обслуживание", description: "Как известно все познается в сравнении, посчитайте, сколько времени уходит на" }
  ]
)

puts "Рекомендации созданы"
# Advantages End

# Bonuses
Bonuse.destroy_all
Bonuse.create!(
  [
    { text: "Визуал + условия (Рекламный макет)", show_text: true },
    { text: "Визуал + условия (Рекламный макет)", show_text: true },
    { text: "Визуал + условия (Рекламный макет)", show_text: true },
    { text: "Визуал + условия (Рекламный макет)", show_text: true }
  ]
)

puts "Бонусы созданы"
# Bonuses End

# Groupes (Support)
Group.destroy_all
Group.create!(
  [
    { title: "Инструкции" },
    { title: "Полезная информация" },
    { title: "Файлы для скачивания (прошивки)" }
  ]
)

puts "Группы (Поддержка) созданы"
# Groupes (Support) End

# Groupes (Support)
Support.destroy_all
Support.create!(
  [
    { title: "Автоматический котел ГЕЛИОС", link: "#", group_id: Group.find_by_title("Инструкции").id },
    { title: "Блок управления котлом с модулем GSM", link: "#", group_id: Group.find_by_title("Инструкции").id },
    { title: "Расчет расхода топлива", link: "#", group_id: Group.find_by_title("Полезная информация").id },
    { title: "Прошивки", link: "#", group_id: Group.find_by_title("Полезная информация").id },
    { title: "Инструкция по обновлению прошивок", link: "#", group_id: Group.find_by_title("Файлы для скачивания (прошивки)").id },
    { title: "Прошивки", link: "#", group_id: Group.find_by_title("Файлы для скачивания (прошивки)").id }
  ]
)

puts "Элементы (Поддержка) созданы"
# Groupes (Support) End

# Contacts
Contact.destroy_all
Contact.create!(
  [
    {
      region: "Кузбасс",
      address: "г. Кемерово, Кузнецкий проспект, 141/1",
      phone: "+7 (923) 521-4143",
      email: "sales.kotelsib@yandex.ru",
      working_hours_weekdays: "пн-пт: 08:00-17:00 (обед 12:00-13:00)",
      working_hours_weekends: "сб, вс: выходной"
    },
    {
      region: "Алтай",
      representative: "Представитель в Алтайском крае: Компания “АлтайТепло”",
      address: "Алтайский край, г. Бийск, ул. Подгорная, 78, стр 5",
      phone: "+7 (962) 805-4371",
      phone_other: "+7 (964) 080-4144"
    }
  ]
)

puts "Контакты созданы"
# Contacts End
