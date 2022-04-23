// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetGuildSelectedEvent

package com.sulake.habbo.catalog.viewer.widgets.events
{
    import flash.events.Event;

    public class CatalogWidgetGuildSelectedEvent extends Event 
    {

        public static const _SafeStr_8344:int = -1;

        private var _SafeStr_4332:int;
        private var _color1:String;
        private var _color2:String;
        private var _SafeStr_4723:String;

        public function CatalogWidgetGuildSelectedEvent(_arg_1:int, _arg_2:String, _arg_3:String, _arg_4:String)
        {
            _SafeStr_4332 = _arg_1;
            _color1 = _arg_2;
            _color2 = _arg_3;
            _SafeStr_4723 = _arg_4;
            super("GUILD_SELECTED");
        }

        public function get guildId():int
        {
            return (_SafeStr_4332);
        }

        public function get color1():String
        {
            return (_color1);
        }

        public function get color2():String
        {
            return (_color2);
        }

        public function get badgeCode():String
        {
            return (_SafeStr_4723);
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets.events

// _SafeStr_4332 = "_-lq" (String#5644, DoABC#4)
// _SafeStr_4723 = "_-41q" (String#3526, DoABC#4)
// _SafeStr_8344 = "_-dv" (String#31874, DoABC#4)


