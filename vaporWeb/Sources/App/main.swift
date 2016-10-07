
// 主要swift Web主项目

import Vapor
import VaporMySQL



let drop = Droplet()

drop.get { req in
    let lang = req.headers["Accept-Language"]?.string ?? "en"
    return try drop.view.make("welcome", [
    	"message": Node.string(drop.localization[lang, "welcome", "title"])
    ])
}

drop.resource("posts", PostController())


drop.get("/hello") { Request in
    return "你好欢迎来到 zhao95@outlook.com 的小站! 这是一个试验站~"
}

drop.get("view") { Requsest in
    return try drop.view.make("view.html")
}

drop.get("fuli") { Request in
    return try drop.view.make("fuli.html")
}

drop.get("css") { Request in
    return try drop.view.make("03-CSS-外部样式.html")
}
drop.get("login") { Request in
    return try drop.view.make("login.html")
}

drop.get("jiemian") { Request in
    return try drop.view.make("index.html")
}

/// 研究数据库



drop.run()
