// by nota

//com.sulake.core.window.services.ServiceManager

package com.sulake.core.window.services
{
    import com.sulake.core.runtime._SafeStr_13;
    import flash.display.DisplayObject;
    import com.sulake.core.window._SafeStr_3160;

    public class ServiceManager implements IInternalWindowServices, _SafeStr_13 
    {

        private var _SafeStr_8237:uint;
        private var _SafeStr_5428:DisplayObject;
        private var _disposed:Boolean = false;
        private var _SafeStr_3728:_SafeStr_3160;
        private var _SafeStr_5659:IMouseDraggingService;
        private var _SafeStr_5660:IMouseScalingService;
        private var _SafeStr_5661:IMouseListenerService;
        private var _SafeStr_5662:_SafeStr_3411;
        private var _SafeStr_5663:IToolTipAgentService;
        private var _SafeStr_5664:_SafeStr_3431;

        public function ServiceManager(_arg_1:_SafeStr_3160, _arg_2:DisplayObject)
        {
            _SafeStr_8237 = 0;
            _SafeStr_5428 = _arg_2;
            _SafeStr_3728 = _arg_1;
            _SafeStr_5659 = new WindowMouseDragger(_arg_2);
            _SafeStr_5660 = new WindowMouseScaler(_arg_2);
            _SafeStr_5661 = new WindowMouseListener(_arg_2);
            _SafeStr_5662 = new FocusManager(_arg_2);
            _SafeStr_5663 = new WindowToolTipAgent(_arg_2);
            _SafeStr_5664 = new GestureAgentService();
        }

        public function dispose():void
        {
            if (_SafeStr_5659 != null)
            {
                _SafeStr_5659.dispose();
                _SafeStr_5659 = null;
            };
            if (_SafeStr_5660 != null)
            {
                _SafeStr_5660.dispose();
                _SafeStr_5660 = null;
            };
            if (_SafeStr_5661 != null)
            {
                _SafeStr_5661.dispose();
                _SafeStr_5661 = null;
            };
            if (_SafeStr_5662 != null)
            {
                _SafeStr_5662.dispose();
                _SafeStr_5662 = null;
            };
            if (_SafeStr_5663 != null)
            {
                _SafeStr_5663.dispose();
                _SafeStr_5663 = null;
            };
            if (_SafeStr_5664 != null)
            {
                _SafeStr_5664.dispose();
                _SafeStr_5664 = null;
            };
            _SafeStr_5428 = null;
            _SafeStr_3728 = null;
            _disposed = true;
        }

        public function getMouseDraggingService():IMouseDraggingService
        {
            return (_SafeStr_5659);
        }

        public function getMouseScalingService():IMouseScalingService
        {
            return (_SafeStr_5660);
        }

        public function getMouseListenerService():IMouseListenerService
        {
            return (_SafeStr_5661);
        }

        public function getFocusManagerService():_SafeStr_3411
        {
            return (_SafeStr_5662);
        }

        public function getToolTipAgentService():IToolTipAgentService
        {
            return (_SafeStr_5663);
        }

        public function getGestureAgentService():_SafeStr_3431
        {
            return (_SafeStr_5664);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }


    }
}//package com.sulake.core.window.services

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3160 = "_-dQ" (String#2821, DoABC#4)
// _SafeStr_3411 = "_-61X" (String#11392, DoABC#4)
// _SafeStr_3431 = "_-91F" (String#10782, DoABC#4)
// _SafeStr_3728 = "_-B1C" (String#3610, DoABC#4)
// _SafeStr_5428 = "_-L19" (String#253, DoABC#4)
// _SafeStr_5659 = "_-R1D" (String#10012, DoABC#4)
// _SafeStr_5660 = "_-TB" (String#10182, DoABC#4)
// _SafeStr_5661 = "_-Ra" (String#10130, DoABC#4)
// _SafeStr_5662 = "_-a1G" (String#10077, DoABC#4)
// _SafeStr_5663 = "_-01H" (String#10200, DoABC#4)
// _SafeStr_5664 = "_-B1W" (String#8917, DoABC#4)
// _SafeStr_8237 = "_-b5" (String#24082, DoABC#4)


