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


drop.run()
