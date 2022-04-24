// by nota

//com.sulake.habbo.navigator.AlertView

package com.sulake.habbo.navigator
{
    import com.sulake.core.runtime._SafeStr_13;
    import flash.utils.Dictionary;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window._SafeStr_3109;
    import flash.geom.Rectangle;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class AlertView implements _SafeStr_13 
    {

        private static var _SafeStr_5507:Dictionary = new Dictionary();

        private var _navigator:_SafeStr_1697;
        protected var _SafeStr_5508:_SafeStr_3263;
        protected var _xmlFileName:String;
        protected var _SafeStr_4004:String;
        protected var _disposed:Boolean;

        public function AlertView(_arg_1:_SafeStr_1697, _arg_2:String, _arg_3:String=null)
        {
            _navigator = _arg_1;
            _xmlFileName = _arg_2;
            _SafeStr_4004 = _arg_3;
        }

        public static function findAlertView(_arg_1:_SafeStr_3109):AlertView
        {
            if (_SafeStr_5507 != null)
            {
                for each (var _local_2:AlertView in _SafeStr_5507)
                {
                    if (_local_2._SafeStr_5508 == _arg_1)
                    {
                        return (_local_2);
                    };
                };
            };
            return (null);
        }


        public function show():void
        {
            var _local_2:AlertView = (_SafeStr_5507[_xmlFileName] as AlertView);
            if (_local_2 != null)
            {
                _local_2.dispose();
            };
            _SafeStr_5508 = getAlertWindow();
            if (_SafeStr_4004 != null)
            {
                _SafeStr_5508.caption = _SafeStr_4004;
            };
            setupAlertWindow(_SafeStr_5508);
            var _local_1:Rectangle = Util.getLocationRelativeTo(_SafeStr_5508.desktop, _SafeStr_5508.width, _SafeStr_5508.height);
            _SafeStr_5508.x = _local_1.x;
            _SafeStr_5508.y = _local_1.y;
            _SafeStr_5507[_xmlFileName] = this;
            _SafeStr_5508.activate();
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            if (_SafeStr_5507[_xmlFileName] == this)
            {
                _SafeStr_5507[_xmlFileName] = null;
            };
            _disposed = true;
            if (_SafeStr_5508 != null)
            {
                _SafeStr_5508.destroy();
                _SafeStr_5508 = null;
            };
            _navigator = null;
        }

        internal function setupAlertWindow(_arg_1:_SafeStr_3263):void
        {
        }

        internal function onClose(_arg_1:WindowMouseEvent):void
        {
            dispose();
        }

        private function getAlertWindow():_SafeStr_3263
        {
            var _local_2:_SafeStr_3263 = (_navigator.getXmlWindow(this._xmlFileName, 2) as _SafeStr_3263);
            var _local_1:_SafeStr_3109 = _local_2.findChildByTag("close");
            if (_local_1 != null)
            {
                _local_1.addEventListener("WME_CLICK", onClose);
            };
            return (_local_2);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get navigator():_SafeStr_1697
        {
            return (_navigator);
        }


    }
}//package com.sulake.habbo.navigator

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1697 = "_-bu" (String#1958, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_4004 = "_-41o" (String#1978, DoABC#4)
// _SafeStr_5507 = "_-lp" (String#5541, DoABC#4)
// _SafeStr_5508 = "_-Zc" (String#4834, DoABC#4)


