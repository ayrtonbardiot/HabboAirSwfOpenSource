// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.navigator.GuestRoomPasswordInput

package com.sulake.habbo.navigator
{
    import com.sulake.core.window.components._SafeStr_3263;
    import _-Ja._SafeStr_1569;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components._SafeStr_3183;
    import flash.geom.Point;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components._SafeStr_3122;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class GuestRoomPasswordInput 
    {

        private var _navigator:_SafeStr_1697;
        private var _window:_SafeStr_3263;
        private var _SafeStr_4608:_SafeStr_1569;

        public function GuestRoomPasswordInput(_arg_1:_SafeStr_1697)
        {
            _navigator = _arg_1;
        }

        public function show(_arg_1:_SafeStr_1569, _arg_2:Point=null):void
        {
            _SafeStr_4608 = _arg_1;
            if (_SafeStr_4608 == null)
            {
                return;
            };
            createWindow();
            if (_window == null)
            {
                return;
            };
            if (_arg_2 != null)
            {
                _arg_2.offset((-(_window.width) / 2), (-(_window.height) / 2));
                _window.setGlobalPosition(_arg_2);
            };
            _window.visible = true;
            _window.activate();
            var _local_3:ITextWindow = (_window.findChildByName("room_name") as ITextWindow);
            if (((!(_local_3 == null)) && (!(_arg_1 == null))))
            {
                _local_3.text = _arg_1.roomName;
            };
            var _local_4:_SafeStr_3183 = (_window.findChildByName("password_input") as _SafeStr_3183);
            if (_local_4 != null)
            {
                _local_4.text = "";
            };
            setInfoText("${navigator.password.info}");
        }

        private function createWindow():void
        {
            if (_window != null)
            {
                return;
            };
            var _local_2:XmlAsset = (_navigator.assets.getAssetByName("password_input_xml") as XmlAsset);
            _window = (_navigator.windowManager.buildFromXML((_local_2.content as XML), 2) as _SafeStr_3263);
            if (_window == null)
            {
                return;
            };
            var _local_4:_SafeStr_3122 = (_window.findChildByName("try") as _SafeStr_3122);
            if (_local_4 != null)
            {
                _local_4.addEventListener("WME_CLICK", onTry);
            };
            var _local_3:_SafeStr_3109 = _window.findChildByName("cancel_region");
            if (_local_3 != null)
            {
                _local_3.addEventListener("WME_CLICK", close);
            };
            var _local_1:_SafeStr_3109 = _window.findChildByTag("close");
            if (_local_1 != null)
            {
                _local_1.addEventListener("WME_CLICK", close);
            };
        }

        public function showRetry():void
        {
            show(_SafeStr_4608);
            setInfoText("${navigator.password.retryinfo}");
        }

        private function setInfoText(_arg_1:String):void
        {
            if (_window == null)
            {
                return;
            };
            var _local_2:ITextWindow = (_window.findChildByName("info") as ITextWindow);
            if (_local_2 == null)
            {
                return;
            };
            _local_2.caption = _arg_1;
        }

        public function dispose():void
        {
            if (_window != null)
            {
                _window.dispose();
            };
            _window = null;
            _navigator = null;
            _SafeStr_4608 = null;
        }

        private function onTry(_arg_1:WindowMouseEvent):void
        {
            var _local_3:_SafeStr_3183 = (_window.findChildByName("password_input") as _SafeStr_3183);
            if (_local_3 == null)
            {
                return;
            };
            var _local_2:String = _local_3.text;
            _navigator.goToRoom(_SafeStr_4608.flatId, true, _local_2);
            hide();
        }

        private function close(_arg_1:WindowMouseEvent):void
        {
            if (_window == null)
            {
                return;
            };
            _window.dispose();
            _window = null;
        }

        private function hide(_arg_1:WindowMouseEvent=null):void
        {
            if (_window == null)
            {
                return;
            };
            _window.visible = false;
        }


    }
}//package com.sulake.habbo.navigator

// _SafeStr_1569 = "_-R1p" (String#1360, DoABC#4)
// _SafeStr_1697 = "_-bu" (String#1958, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3122 = "_-i1L" (String#666, DoABC#4)
// _SafeStr_3183 = "_-ij" (String#6244, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_4608 = "_-X1z" (String#5156, DoABC#4)


