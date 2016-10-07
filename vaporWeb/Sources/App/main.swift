
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
