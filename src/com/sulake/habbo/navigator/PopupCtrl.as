// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.navigator.PopupCtrl

package com.sulake.habbo.navigator
{
    import flash.utils.Timer;
    import com.sulake.core.window._SafeStr_3133;
    import flash.geom.Point;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.events.TimerEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events._SafeStr_3116;

    public class PopupCtrl 
    {

        private var _navigator:HabboNavigator;
        private var _xmlFileName:String;
        private var _SafeStr_6840:int;
        private var _SafeStr_6841:int;
        private var _SafeStr_6839:Timer = new Timer(500, 1);
        private var _hideTimer:Timer = new Timer(100, 1);
        private var _popup:_SafeStr_3133;

        public function PopupCtrl(_arg_1:HabboNavigator, _arg_2:int, _arg_3:int, _arg_4:String)
        {
            _navigator = _arg_1;
            _xmlFileName = _arg_4;
            _SafeStr_6840 = _arg_2;
            _SafeStr_6841 = _arg_3;
            _SafeStr_6839.addEventListener("timer", onDisplayTimer);
            _hideTimer.addEventListener("timer", onHideTimer);
        }

        public function get navigator():HabboNavigator
        {
            return (_navigator);
        }

        public function dispose():void
        {
            _navigator = null;
            if (_SafeStr_6839)
            {
                _SafeStr_6839.removeEventListener("timer", onDisplayTimer);
                _SafeStr_6839.reset();
                _SafeStr_6839 = null;
            };
            if (_hideTimer)
            {
                _hideTimer.removeEventListener("timer", onHideTimer);
                _hideTimer.reset();
                _hideTimer = null;
            };
        }

        public function showPopup(_arg_1:_SafeStr_3109):void
        {
            if (_popup == null)
            {
                _popup = _SafeStr_3133(_navigator.getXmlWindow(_xmlFileName));
                _popup.visible = false;
                _popup.setParamFlag(1, true);
                _popup.procedure = onPopup;
            };
            Util.hideChildren(_popup);
            refreshContent(_popup);
            _popup.height = (Util.getLowestPoint(_popup) + 5);
            var _local_2:Point = new Point();
            _arg_1.getGlobalPosition(_local_2);
            _popup.x = ((_local_2.x + _SafeStr_6840) + _arg_1.width);
            _popup.y = ((_local_2.y - (_popup.height * 0.5)) + (_arg_1.height * 0.5));
            var _local_3:Point = new Point();
            _popup.getGlobalPosition(_local_3);
            if ((_local_3.x + _popup.width) > _popup.desktop.width)
            {
                _popup.x = ((-(_popup.width) + _local_2.x) + _SafeStr_6841);
                refreshPopupArrows(_popup, false);
            }
            else
            {
                refreshPopupArrows(_popup, true);
            };
            if (!_popup.visible)
            {
                _SafeStr_6839.reset();
                _SafeStr_6839.start();
            };
            _hideTimer.reset();
            _popup.activate();
        }

        public function closePopup():void
        {
            _hideTimer.reset();
            _SafeStr_6839.reset();
            _hideTimer.start();
        }

        private function refreshPopupArrows(_arg_1:_SafeStr_3133, _arg_2:Boolean):void
        {
            refreshPopupArrow(_arg_1, true, _arg_2);
            refreshPopupArrow(_arg_1, false, (!(_arg_2)));
        }

        private function refreshPopupArrow(_arg_1:_SafeStr_3133, _arg_2:Boolean, _arg_3:Boolean):void
        {
            var _local_4:String = ("popup_arrow_" + ((_arg_2) ? "left" : "right"));
            var _local_5:_SafeStr_3264 = _SafeStr_3264(_arg_1.findChildByName(_local_4));
            if (!_arg_3)
            {
                if (_local_5 != null)
                {
                    _local_5.visible = false;
                };
            }
            else
            {
                if (_local_5 == null)
                {
                    _local_5 = _navigator.getButton(_local_4, _local_4, null);
                    _local_5.setParamFlag(16, false);
                    _arg_1.addChild(_local_5);
                };
                _local_5.visible = true;
                _local_5.y = ((_arg_1.height * 0.5) - (_local_5.height * 0.5));
                _local_5.x = ((_arg_2) ? (1 - _local_5.width) : (_arg_1.width - 1));
            };
        }

        private function onDisplayTimer(_arg_1:TimerEvent):void
        {
            this._popup.visible = true;
            this._popup.activate();
        }

        private function onHideTimer(_arg_1:TimerEvent):void
        {
            if (_popup != null)
            {
                _popup.visible = false;
            };
        }

        public function hideInstantly():void
        {
            if (_popup != null)
            {
                _popup.visible = false;
            };
            this._SafeStr_6839.reset();
            this._hideTimer.reset();
        }

        public function get visible():Boolean
        {
            return ((!(this._popup == null)) && (this._popup.visible));
        }

        public function refreshContent(_arg_1:_SafeStr_3133):void
        {
        }

        private function onPopup(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if ((_arg_1 as WindowMouseEvent) == null)
            {
                return;
            };
            if (_arg_1.type == "WME_OVER")
            {
                this._hideTimer.reset();
            }
            else
            {
                if (_arg_1.type == "WME_OUT")
                {
                    if (!Util.containsMouse(_popup))
                    {
                        this.closePopup();
                    };
                };
            };
        }


    }
}//package com.sulake.habbo.navigator

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_6839 = "_-Ey" (String#5559, DoABC#4)
// _SafeStr_6840 = "_-NJ" (String#18953, DoABC#4)
// _SafeStr_6841 = "_-k16" (String#17763, DoABC#4)


