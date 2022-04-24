// by nota

//com.sulake.habbo.ui.widget.furniture.trophy.TrophyView

package com.sulake.habbo.ui.widget.furniture.trophy
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.display.BitmapData;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class TrophyView implements ITrophyView 
    {

        private static const BG_IMAGE_LIST:Array = new Array("trophy_bg_gold", "trophy_bg_silver", "trophy_bg_bronze");
        private static const BG_COLOR_LIST:Array = new Array(4293707079, 4291411404, 4290279476);

        private var _SafeStr_4981:ITrophyFurniWidget;
        private var _window:_SafeStr_3133;

        public function TrophyView(_arg_1:ITrophyFurniWidget)
        {
            _SafeStr_4981 = _arg_1;
        }

        public function dispose():void
        {
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
            _SafeStr_4981 = null;
        }

        public function showInterface():Boolean
        {
            var _local_2:* = null;
            var _local_9:* = null;
            var _local_6:* = null;
            var _local_3:* = null;
            var _local_7:* = null;
            var _local_5:* = null;
            var _local_4:* = null;
            var _local_8:* = null;
            var _local_10:IAsset = _SafeStr_4981.assets.getAssetByName("trophy");
            var _local_1:XmlAsset = XmlAsset(_local_10);
            if (_local_1 == null)
            {
                return (false);
            };
            if (_window == null)
            {
                _window = (_SafeStr_4981.windowManager.buildFromXML((_local_1.content as XML)) as _SafeStr_3133);
            };
            _window.center();
            _local_2 = _window.findChildByName("close");
            if (_local_2 != null)
            {
                _local_2.addEventListener("WME_CLICK", onMouseEvent);
            };
            _local_9 = (_window.findChildByName("title_bg") as _SafeStr_3133);
            if (_local_9 != null)
            {
                _local_9.color = BG_COLOR_LIST[_SafeStr_4981.color];
            };
            _local_6 = (_window.findChildByName("greeting") as ITextWindow);
            if (_local_6 != null)
            {
                _local_6.text = _SafeStr_4981.message.replace(/\\r/g, "\n");
            };
            _local_3 = (_window.findChildByName("date") as ITextWindow);
            if (_local_3 != null)
            {
                _local_3.text = _SafeStr_4981.date;
            };
            _local_7 = (_window.findChildByName("name") as ITextWindow);
            if (_local_7 != null)
            {
                _local_7.text = _SafeStr_4981.name;
            };
            _local_5 = (_SafeStr_4981.assets.getAssetByName(BG_IMAGE_LIST[_SafeStr_4981.color]) as BitmapDataAsset);
            _local_8 = (_window.findChildByName("trophy_bg") as _SafeStr_3264);
            if (_local_5 != null)
            {
                _local_4 = (_local_5.content as BitmapData);
                _local_8.bitmap = _local_4;
            };
            return (true);
        }

        public function disposeInterface():void
        {
            if (_window != null)
            {
                _window.dispose();
                _window = null;
            };
        }

        private function onMouseEvent(_arg_1:WindowMouseEvent):void
        {
            disposeInterface();
        }


    }
}//package com.sulake.habbo.ui.widget.furniture.trophy

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)


