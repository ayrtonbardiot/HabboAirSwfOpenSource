// by nota

//com.sulake.habbo.help.cfh.registry.instantmessage.InstantMessageRegistryItem

package com.sulake.habbo.help.cfh.registry.instantmessage
{
    public class InstantMessageRegistryItem 
    {

        private var _index:int;
        private var _SafeStr_4128:int;
        private var _username:String = "";
        private var _SafeStr_5859:String = "";
        private var _chatTime:Date;
        private var _selected:Boolean;

        public function InstantMessageRegistryItem(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:String)
        {
            _index = _arg_1;
            _SafeStr_4128 = _arg_2;
            _username = _arg_3;
            _SafeStr_5859 = _arg_4;
            _selected = false;
            _chatTime = new Date();
        }

        public function get index():int
        {
            return (_index);
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get userName():String
        {
            return (_username);
        }

        public function get text():String
        {
            return (_SafeStr_5859);
        }

        public function get selected():Boolean
        {
            return (_selected);
        }

        public function set selected(_arg_1:Boolean):void
        {
            _selected = _arg_1;
        }

        public function get chatTime():Date
        {
            return (_chatTime);
        }


    }
}//package com.sulake.habbo.help.cfh.registry.instantmessage

// _SafeStr_4128 = "_-q1y" (String#518, DoABC#4)
// _SafeStr_5859 = "_-n1P" (String#20939, DoABC#4)


