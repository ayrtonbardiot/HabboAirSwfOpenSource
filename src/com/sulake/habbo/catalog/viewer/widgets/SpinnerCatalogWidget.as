// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.viewer.widgets.SpinnerCatalogWidget

package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.catalog.HabboCatalog;
    import flash.utils.Timer;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetSpinnerEvent;
    import flash.events.TimerEvent;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.events.WindowKeyboardEvent;

    public class SpinnerCatalogWidget extends CatalogWidget implements _SafeStr_3303 
    {

        private static const SPIN_BUTTONDOWN_HOLD_VALUE_STEP_DELAY_MS:int = 75;
        private static const _SafeStr_8357:int = 35;

        private var _catalog:HabboCatalog;
        private var _SafeStr_4525:int = 1;
        private var _SafeStr_6403:int = 1;
        private var _SafeStr_6404:int = 100;
        private var _SafeStr_6883:Timer;
        private var _SafeStr_6884:Boolean = false;
        private var _SafeStr_6886:Boolean = false;
        private var _SafeStr_6888:Boolean = false;
        private var _SafeStr_6885:int = 1;
        private var _SafeStr_6887:Array = new Array(0);
        private var _promoInfo:_SafeStr_3109;

        public function SpinnerCatalogWidget(_arg_1:_SafeStr_3133, _arg_2:HabboCatalog)
        {
            super(_arg_1);
            _catalog = _arg_2;
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                if (_SafeStr_6883 != null)
                {
                    _SafeStr_6883.stop();
                    _SafeStr_6883 = null;
                };
                events.removeEventListener("CWSE_RESET", onRequestResetEvent);
                events.removeEventListener("CWSE_SHOW", onShowEvent);
                events.removeEventListener("CWSE_HIDE", onHideEvent);
                events.removeEventListener("CWSE_SET_MAX", onSetMaxEvent);
                events.removeEventListener("CWSE_SET_MIN", onSetMinEvent);
                super.dispose();
            };
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return (false);
            };
            attachWidgetView("spinnerWidget");
            window.visible = false;
            if (!_catalog.multiplePurchaseEnabled)
            {
                return (true);
            };
            window.procedure = spinnerWindowProcedure;
            var _local_1:ITextFieldWindow = (window.findChildByName("text_value") as ITextFieldWindow);
            if (_local_1)
            {
                _local_1.addEventListener("WKE_KEY_UP", onInputEvent);
            };
            events.addEventListener("CWSE_RESET", onRequestResetEvent);
            events.addEventListener("CWSE_SHOW", onShowEvent);
            events.addEventListener("CWSE_HIDE", onHideEvent);
            events.addEventListener("CWSE_SET_MAX", onSetMaxEvent);
            events.addEventListener("CWSE_SET_MIN", onSetMinEvent);
            _SafeStr_6883 = new Timer(75);
            _SafeStr_6883.addEventListener("timer", onSpinnerTimerEvent);
            _promoInfo = window.findChildByName("promo.info");
            return (true);
        }

        private function refresh():void
        {
            var _local_1:int;
            _SafeStr_4525 = Math.max(_SafeStr_4525, _SafeStr_6403);
            _SafeStr_4525 = Math.min(_SafeStr_4525, _SafeStr_6404);
            events.dispatchEvent(new CatalogWidgetSpinnerEvent("CWSE_VALUE_CHANGED", _SafeStr_4525));
            setValueText(_SafeStr_4525.toString());
            if (((_promoInfo) && (_catalog.bundleDiscountEnabled)))
            {
                _local_1 = _catalog.utils.getDiscountItemsCount(_SafeStr_4525);
                window.findChildByName("discountContainer").visible = (_local_1 > 0);
                _catalog.localization.registerParameter("shop.bonus.items.count", "amount", _local_1.toString());
            };
        }

        private function onRequestResetEvent(_arg_1:CatalogWidgetSpinnerEvent):void
        {
            _SafeStr_4525 = _arg_1.value;
            if (_arg_1.skipSteps != null)
            {
                _SafeStr_6887 = _arg_1.skipSteps;
            };
            refresh();
        }

        private function onShowEvent(_arg_1:CatalogWidgetSpinnerEvent):void
        {
            window.visible = true;
        }

        private function onHideEvent(_arg_1:CatalogWidgetSpinnerEvent):void
        {
            window.visible = false;
        }

        private function onSetMaxEvent(_arg_1:CatalogWidgetSpinnerEvent):void
        {
            _SafeStr_6404 = _arg_1.value;
        }

        private function onSetMinEvent(_arg_1:CatalogWidgetSpinnerEvent):void
        {
            _SafeStr_6403 = _arg_1.value;
        }

        private function onSpinnerTimerEvent(_arg_1:TimerEvent):void
        {
            if (disposed)
            {
                return;
            };
            _SafeStr_6888 = true;
            if (_SafeStr_6884)
            {
                increaseValue();
                if ((_SafeStr_4525 - _SafeStr_6885) > 35)
                {
                    increaseValue();
                };
            };
            if (_SafeStr_6886)
            {
                decreaseValue();
                if ((_SafeStr_6885 - _SafeStr_4525) > 35)
                {
                    decreaseValue();
                };
            };
            refresh();
        }

        private function increaseValue():void
        {
            var _local_1:int = (_SafeStr_4525 + 1);
            while (_SafeStr_6887.indexOf(_local_1) != -1)
            {
                _local_1++;
            };
            _SafeStr_4525 = _local_1;
        }

        private function decreaseValue():void
        {
            var _local_1:int = (_SafeStr_4525 - 1);
            while (_SafeStr_6887.indexOf(_local_1) != -1)
            {
                _local_1--;
            };
            _SafeStr_4525 = _local_1;
        }

        private function setValueText(_arg_1:String):void
        {
            if (_window == null)
            {
                return;
            };
            if ((_window.findChildByName("text_value") is ITextFieldWindow))
            {
                if (_window.findChildByName("text_value").caption.length > 0)
                {
                    _window.findChildByName("text_value").caption = _arg_1;
                };
            }
            else
            {
                _window.findChildByName("text_value").caption = _arg_1;
            };
        }

        private function spinnerWindowProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109=null):void
        {
            if (!_arg_1)
            {
                return;
            };
            if (((((!(_arg_1.type == "WME_CLICK")) && (!(_arg_1.type == "WME_DOWN"))) && (!(_arg_1.type == "WME_UP"))) && (!(_arg_1.type == "WME_UP_OUTSIDE"))))
            {
                return;
            };
            switch (_arg_1.target.name)
            {
                case "button_less":
                    switch (_arg_1.type)
                    {
                        case "WME_DOWN":
                            _SafeStr_6886 = true;
                            _SafeStr_6885 = _SafeStr_4525;
                            _SafeStr_6883.start();
                            break;
                        case "WME_UP":
                        case "WME_UP_OUTSIDE":
                            _SafeStr_6886 = false;
                            _SafeStr_6883.stop();
                            break;
                        case "WME_CLICK":
                            if (!_SafeStr_6888)
                            {
                                decreaseValue();
                            };
                            refresh();
                            _SafeStr_6888 = false;
                    };
                    return;
                case "button_more":
                    switch (_arg_1.type)
                    {
                        case "WME_DOWN":
                            _SafeStr_6884 = true;
                            _SafeStr_6885 = _SafeStr_4525;
                            _SafeStr_6883.start();
                            break;
                        case "WME_UP":
                        case "WME_UP_OUTSIDE":
                            _SafeStr_6884 = false;
                            _SafeStr_6883.stop();
                            break;
                        case "WME_CLICK":
                            if (!_SafeStr_6888)
                            {
                                increaseValue();
                            };
                            refresh();
                            _SafeStr_6888 = false;
                    };
                    return;
            };
        }

        private function onInputEvent(_arg_1:WindowKeyboardEvent):void
        {
            _SafeStr_4525 = parseInt(_arg_1.target.caption);
            refresh();
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3303 = "_-g1Z" (String#1682, DoABC#4)
// _SafeStr_4525 = "_-8S" (String#1037, DoABC#4)
// _SafeStr_6403 = "_-X1I" (String#2306, DoABC#4)
// _SafeStr_6404 = "_-U12" (String#2486, DoABC#4)
// _SafeStr_6883 = "_-Jj" (String#6425, DoABC#4)
// _SafeStr_6884 = "_-YF" (String#11597, DoABC#4)
// _SafeStr_6885 = "_-Yv" (String#11109, DoABC#4)
// _SafeStr_6886 = "_-21t" (String#13121, DoABC#4)
// _SafeStr_6887 = "_-W1Y" (String#6920, DoABC#4)
// _SafeStr_6888 = "_-M1s" (String#8309, DoABC#4)
// _SafeStr_8357 = "_-q1Z" (String#41107, DoABC#4)


