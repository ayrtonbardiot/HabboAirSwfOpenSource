// by nota

//com.sulake.habbo.ui.widget.crafting.controller.CraftingProgressBarController

package com.sulake.habbo.ui.widget.crafting.controller
{
    import com.sulake.habbo.ui.widget.crafting.CraftingWidget;
    import flash.utils.Timer;
    import com.sulake.core.window._SafeStr_3109;
    import flash.events.TimerEvent;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3133;

    public class CraftingProgressBarController 
    {

        private var _SafeStr_4981:CraftingWidget;
        private var _SafeStr_6526:Timer;
        private var _SafeStr_6527:Number;

        public function CraftingProgressBarController(_arg_1:CraftingWidget)
        {
            _SafeStr_4981 = _arg_1;
            _SafeStr_6526 = new Timer(70);
            _SafeStr_6526.addEventListener("timer", onProgressTimerEvent);
        }

        public function dispose():void
        {
            _SafeStr_4981 = null;
        }

        private function setProgress(_arg_1:Number):void
        {
            var _local_3:* = null;
            var _local_2:_SafeStr_3109 = container.findChildByName("btn_cancel");
            var _local_4:_SafeStr_3109 = ((container) ? container.findChildByName("bar") : null);
            if (_local_4)
            {
                _local_3 = _local_4.parent;
                _local_4.width = (_local_2.width * _arg_1);
            };
        }

        private function onProgressTimerEvent(_arg_1:TimerEvent):void
        {
            var _local_2:* = (_SafeStr_6527 + 0.02);
            _SafeStr_6527 = _local_2;
            setProgress(_local_2);
            if (_SafeStr_6527 >= 1)
            {
                hide();
                _SafeStr_4981.infoCtrl.onProgressBarComplete();
            };
        }

        public function hide():void
        {
            if (_SafeStr_6526)
            {
                _SafeStr_6526.stop();
            };
            if (container)
            {
                container.visible = false;
                container.procedure = null;
            };
        }

        public function show():void
        {
            _SafeStr_6526.start();
            _SafeStr_6527 = 0;
            if (container)
            {
                container.visible = true;
                container.procedure = onTriggered;
            };
        }

        private function onTriggered(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_DOWN")
            {
                return;
            };
            _SafeStr_4981.infoCtrl.cancelCrafting();
        }

        private function get container():_SafeStr_3133
        {
            if (((!(_SafeStr_4981)) || (!(_SafeStr_4981.window))))
            {
                return (null);
            };
            return (_SafeStr_4981.window.findChildByName("progress_bar") as _SafeStr_3133);
        }


    }
}//package com.sulake.habbo.ui.widget.crafting.controller

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_6526 = "_-rC" (String#10822, DoABC#4)
// _SafeStr_6527 = "_-a1Q" (String#11436, DoABC#4)


