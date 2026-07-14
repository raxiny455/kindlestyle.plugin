local BD = require("ui/bidi")
local WidgetContainer = require("ui/widget/container/widgetcontainer")
local Event = require("ui/event")

local KindleStyle = WidgetContainer:extend{
    name = "kindlestyle",
}

function KindleStyle:init()
    self:onDispatcherRegisterActions()
end

function KindleStyle:onDispatcherRegisterActions()
    self.ui.menu:registerToMainMenu(self)
end

function KindleStyle:addToMainMenu(menu_items)
    menu_items.kindle_style = {
        text = "Kindle Style",
        sub_item_table = {
            {
                text = "Apply Kindle formatting",
                callback = function()
                    self:applyStyle()
                end,
            },
        },
    }
end

function KindleStyle:applyStyle()

    local settings = self.ui.document.settings

    settings:set("text_align", "justify")
    settings:set("line_spacing", 1.2)

    settings:set("margin_left", 15)
    settings:set("margin_right", 15)

    settings:set("paragraph_indent", 1.2)

    settings:save()

    self.ui:handleEvent(Event:new("UpdateView"))

end

return KindleStyle
