// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.window.widgets.RoomThumbnailWidget

package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.utils.IIterator;

    public class RoomThumbnailWidget implements IRoomThumbnailWidget 
    {

        public static const TYPE:String = "room_thumbnail";

        private var _SafeStr_5427:_SafeStr_3199;
        private var _windowManager:HabboWindowManagerComponent;
        private var _SafeStr_5428:_SafeStr_3133;

        public function RoomThumbnailWidget(_arg_1:_SafeStr_3199, _arg_2:HabboWindowManagerComponent)
        {
            _SafeStr_5427 = _arg_1;
            _windowManager = _arg_2;
            _SafeStr_5428 = (_windowManager.buildFromXML((_windowManager.assets.getAssetByName("room_thumbnail_xml").content as XML)) as _SafeStr_3133);
            _SafeStr_5427.rootWindow = _SafeStr_5428;
            _SafeStr_5428.width = _SafeStr_5427.width;
            _SafeStr_5428.height = _SafeStr_5427.height;
        }

        public function reset():void
        {
        }

        public function set flatId(_arg_1:int):void
        {
        }

        public function get properties():Array
        {
            return (null);
        }

        public function set properties(_arg_1:Array):void
        {
        }

        public function dispose():void
        {
        }

        public function get disposed():Boolean
        {
            return (false);
        }

        public function get iterator():IIterator
        {
            return (null);
        }


    }
}//package com.sulake.habbo.window.widgets

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_5427 = "_-h1n" (String#409, DoABC#4)
// _SafeStr_5428 = "_-L19" (String#253, DoABC#4)


