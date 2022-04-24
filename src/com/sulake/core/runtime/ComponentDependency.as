// by nota

//com.sulake.core.runtime.ComponentDependency

package com.sulake.core.runtime
{
    public class ComponentDependency 
    {

        private var _SafeStr_6199:IID;
        private var _SafeStr_8059:Function;
        private var _SafeStr_8060:Boolean;
        private var _eventListeners:Array;

        public function ComponentDependency(_arg_1:IID, _arg_2:Function, _arg_3:Boolean=true, _arg_4:Array=null)
        {
            _SafeStr_6199 = _arg_1;
            _SafeStr_8059 = _arg_2;
            _SafeStr_8060 = _arg_3;
            _eventListeners = _arg_4;
        }

        internal function get identifier():IID
        {
            return (_SafeStr_6199);
        }

        internal function get dependencySetter():Function
        {
            return (_SafeStr_8059);
        }

        internal function get isRequired():Boolean
        {
            return (_SafeStr_8060);
        }

        internal function get eventListeners():Array
        {
            return (_eventListeners);
        }


    }
}//package com.sulake.core.runtime

// _SafeStr_6199 = "_-z1d" (String#10668, DoABC#3)
// _SafeStr_8059 = "_-c1f" (String#9120, DoABC#3)
// _SafeStr_8060 = "_-w1n" (String#10464, DoABC#3)


