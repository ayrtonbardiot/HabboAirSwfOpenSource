// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetUpdateRoomPreviewEvent

package com.sulake.habbo.catalog.viewer.widgets.events
{
    import flash.events.Event;

    public class CatalogWidgetUpdateRoomPreviewEvent extends Event 
    {

        private var _SafeStr_4778:String = "default";
        private var _SafeStr_4777:String = "default";
        private var _SafeStr_4779:String = "1.1";
        private var _SafeStr_5860:int = 64;

        public function CatalogWidgetUpdateRoomPreviewEvent(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:int, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super("UPDATE_ROOM_PREVIEW", _arg_5, _arg_6);
            _SafeStr_4777 = _arg_1;
            _SafeStr_4778 = _arg_2;
            _SafeStr_4779 = _arg_3;
            _SafeStr_5860 = _arg_4;
        }

        public function get wallType():String
        {
            return (_SafeStr_4778);
        }

        public function get floorType():String
        {
            return (_SafeStr_4777);
        }

        public function get landscapeType():String
        {
            return (_SafeStr_4779);
        }

        public function get tileSize():int
        {
            return (_SafeStr_5860);
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets.events

// _SafeStr_4777 = "_-S1M" (String#5362, DoABC#4)
// _SafeStr_4778 = "_-xi" (String#5315, DoABC#4)
// _SafeStr_4779 = "_-BB" (String#5266, DoABC#4)
// _SafeStr_5860 = "_-Vr" (String#10066, DoABC#4)


