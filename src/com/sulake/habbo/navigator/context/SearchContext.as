// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.navigator.context.SearchContext

package com.sulake.habbo.navigator.context
{
    public class SearchContext 
    {

        private var _SafeStr_5104:String;
        private var _filtering:String;

        public function SearchContext(_arg_1:String, _arg_2:String)
        {
            this._SafeStr_5104 = _arg_1;
            this._filtering = _arg_2;
        }

        public function get searchCode():String
        {
            return (_SafeStr_5104);
        }

        public function get filtering():String
        {
            return (_filtering);
        }

        public function toString():String
        {
            return ((_SafeStr_5104 + " : ") + _filtering);
        }


    }
}//package com.sulake.habbo.navigator.context

// _SafeStr_5104 = "_-T14" (String#21826, DoABC#4)


