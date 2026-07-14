local WidgetContainer = require("ui/widget/container/widgetcontainer")
local Event = require("ui/event")

local KindleStyle = WidgetContainer:extend{
    name = "kindlestyle",
}

function KindleStyle:init()
    self:registerKeyEvents()
end


function KindleStyle:onDispatcherRegisterActions()
end


function KindleStyle:onReaderReady()
    self:applyKindleStyle()
end


function KindleStyle:applyKindleStyle()

    local settings = self.ui.document.settings

    -- Kindle Paperwhite style layout
    settings:set("text_align", "justify")
    settings:set("line_spacing", 1.2)

    -- narrower Kindle-like text column
    settings:set("margin_left", 25)
    settings:set("margin_right", 25)

    -- paragraph style
    settings:set("paragraph_indent", 1.2)

    -- remove ugly publisher formatting
    settings:set("embedded_css", false)
    settings:set("embedded_fonts", false)

    settings:save()

    self.ui:handleEvent(Event:new("UpdateView"))
end


return KindleStyle
