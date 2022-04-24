// by nota

//com.sulake.core.window.utils.EventProcessorState

package com.sulake.core.window.utils
{
    import com.sulake.core.window.graphics._SafeStr_3119;
    import com.sulake.core.window.components._SafeStr_3216;
    import com.sulake.core.window._SafeStr_3109;
    import __AS3__.vec.Vector;
    import com.sulake.core.window.IInputEventTracker;

    public class EventProcessorState 
    {

        public var renderer:_SafeStr_3119;
        public var desktop:_SafeStr_3216;
        public var _SafeStr_6256:_SafeStr_3109;
        public var lastClickTarget:_SafeStr_3109;
        public var eventTrackers:Vector.<IInputEventTracker>;

        public function EventProcessorState(_arg_1:_SafeStr_3119, _arg_2:_SafeStr_3216, _arg_3:_SafeStr_3109, _arg_4:_SafeStr_3109, _arg_5:Vector.<IInputEventTracker>)
        {
            this.renderer = _arg_1;
            this.desktop = _arg_2;
            this._SafeStr_6256 = _arg_3;
            this.lastClickTarget = _arg_4;
            this.eventTrackers = _arg_5;
        }

    }
}//package com.sulake.core.window.utils

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3119 = "_-y1F" (String#6445, DoABC#4)
// _SafeStr_3216 = "_-o1L" (String#2319, DoABC#4)
// _SafeStr_6256 = "_-61c" (String#11678, DoABC#4)


