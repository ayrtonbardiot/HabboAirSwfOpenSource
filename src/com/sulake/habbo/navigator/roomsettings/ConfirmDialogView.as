// by nota

//com.sulake.habbo.navigator.roomsettings.ConfirmDialogView

package com.sulake.habbo.navigator.roomsettings
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.habbo.navigator.Util;
    import flash.geom.Rectangle;
    import com.sulake.habbo.navigator._SafeStr_1697;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class ConfirmDialogView implements _SafeStr_13 
    {

        private var _window:_SafeStr_3263;
        private var _SafeStr_6442:Function;

        public function ConfirmDialogView(_arg_1:_SafeStr_1697, _arg_2:Function, _arg_3:String, _arg_4:String)
        {
            this._window = _SafeStr_3263(_arg_1.getXmlWindow("ros_confirm"));
            this._SafeStr_6442 = _arg_2;
            _window.findChildByTag("close").addEventListener("WME_CLICK", onCancel);
            _window.findChildByName("ok").addEventListener("WME_CLICK", onOk);
            _window.caption = _arg_3;
            _window.findChildByName("message").caption = _arg_4;
            var _local_5:Rectangle = Util.getLocationRelativeTo(_window.desktop, _window.width, _window.height);
            _window.x = _local_5.x;
            _window.y = _local_5.y;
            _window.visible = true;
            _window.activate();
        }

        private function onCancel(_arg_1:WindowMouseEvent):void
        {
            dispose();
        }

        private function onOk(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_6442.apply();
            dispose();
        }

        public function dispose():void
        {
            if (_window != null)
            {
                _window.destroy();
                _window = null;
            };
            _SafeStr_6442 = null;
        }

        public function get disposed():Boolean
        {
            return (_window == null);
        }


    }
}//package com.sulake.habbo.navigator.roomsettings

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1697 = "_-bu" (String#1958, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_6442 = "_-81U" (String#15382, DoABC#4)


