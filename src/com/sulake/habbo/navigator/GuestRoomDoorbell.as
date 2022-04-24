// by nota

//com.sulake.habbo.navigator.GuestRoomDoorbell

package com.sulake.habbo.navigator
{
    import com.sulake.core.window.components._SafeStr_3263;
    import _-Ja._SafeStr_1569;
    import com.sulake.core.window.components.ITextWindow;
    import flash.geom.Point;
    import com.sulake.core.window.components._SafeStr_3122;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events.WindowMouseEvent;
    import _-IR._SafeStr_316;

    public class GuestRoomDoorbell 
    {

        private var _navigator:_SafeStr_1697;
        private var _window:_SafeStr_3263;
        private var _SafeStr_4608:_SafeStr_1569;
        private var _SafeStr_4607:Boolean;

        public function GuestRoomDoorbell(_arg_1:_SafeStr_1697)
        {
            _navigator = _arg_1;
        }

        public function show(_arg_1:_SafeStr_1569, _arg_2:Point=null, _arg_3:Boolean=false):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _SafeStr_4608 = _arg_1;
            _SafeStr_4607 = _arg_3;
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
            var _local_4:ITextWindow = (_window.findChildByName("room_name") as ITextWindow);
            if (_local_4 != null)
            {
                _local_4.text = _arg_1.roomName;
            };
            if (_SafeStr_4607)
            {
                setText("info", "${navigator.doorbell.waiting}");
                setText("cancel", "${navigator.doorbell.button.cancel.entering}");
                showButton("ring", false);
            }
            else
            {
                setText("info", "${navigator.doorbell.info}");
                setText("cancel", "${generic.cancel}");
                showButton("ring", true);
            };
        }

        public function showWaiting():void
        {
            show(_SafeStr_4608, null, true);
        }

        public function showNoAnswer():void
        {
            if (_window == null)
            {
                return;
            };
            _window.visible = true;
            _window.activate();
            setText("info", "${navigator.doorbell.no.answer}");
            showButton("ring", false);
        }

        private function showButton(_arg_1:String, _arg_2:Boolean):void
        {
            var _local_3:_SafeStr_3122 = (_window.findChildByName(_arg_1) as _SafeStr_3122);
            if (_local_3 == null)
            {
                return;
            };
            _local_3.visible = _arg_2;
        }

        private function createWindow():void
        {
            if (_window != null)
            {
                return;
            };
            var _local_2:XmlAsset = (_navigator.assets.getAssetByName("doorbell_xml") as XmlAsset);
            _window = (_navigator.windowManager.buildFromXML((_local_2.content as XML), 2) as _SafeStr_3263);
            if (_window == null)
            {
                return;
            };
            var _local_4:_SafeStr_3122 = (_window.findChildByName("ring") as _SafeStr_3122);
            if (_local_4 != null)
            {
                _local_4.addEventListener("WME_CLICK", ringDoorbell);
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

        private function setText(_arg_1:String, _arg_2:String):void
        {
            if (_window == null)
            {
                return;
            };
            var _local_3:_SafeStr_3109 = _window.findChildByName(_arg_1);
            if (_local_3 == null)
            {
                return;
            };
            _local_3.caption = _arg_2;
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

        private function ringDoorbell(_arg_1:WindowMouseEvent):void
        {
            _navigator.goToRoom(_SafeStr_4608.flatId, true);
            hide();
        }

        private function close(_arg_1:WindowMouseEvent):void
        {
            if (_window == null)
            {
                return;
            };
            if (((_SafeStr_4607) && (!(_navigator == null))))
            {
                _navigator.send(new _SafeStr_316());
            };
            _window.dispose();
            _window = null;
        }

        public function hide():void
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
// _SafeStr_316 = "_-hs" (String#6384, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_4607 = "_-X1x" (String#14356, DoABC#4)
// _SafeStr_4608 = "_-X1z" (String#5156, DoABC#4)


