// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.structure.parts.PartDefinition

package com.sulake.habbo.avatar.structure.parts
{
    public class PartDefinition 
    {

        private var _SafeStr_5799:String;
        private var _SafeStr_5800:String;
        private var _SafeStr_5801:String;
        private var _SafeStr_5802:Boolean;
        private var _SafeStr_5798:int = -1;

        public function PartDefinition(_arg_1:XML)
        {
            _SafeStr_5799 = String(_arg_1.@["set-type"]);
            _SafeStr_5800 = String(_arg_1.@["flipped-set-type"]);
            _SafeStr_5801 = String(_arg_1.@["remove-set-type"]);
            _SafeStr_5802 = false;
        }

        public function hasStaticId():Boolean
        {
            return (_SafeStr_5798 >= 0);
        }

        public function get staticId():int
        {
            return (_SafeStr_5798);
        }

        public function set staticId(_arg_1:int):void
        {
            _SafeStr_5798 = _arg_1;
        }

        public function get setType():String
        {
            return (_SafeStr_5799);
        }

        public function get flippedSetType():String
        {
            return (_SafeStr_5800);
        }

        public function get removeSetType():String
        {
            return (_SafeStr_5801);
        }

        public function get appendToFigure():Boolean
        {
            return (_SafeStr_5802);
        }

        public function set appendToFigure(_arg_1:Boolean):void
        {
            _SafeStr_5802 = _arg_1;
        }

        public function set flippedSetType(_arg_1:String):void
        {
            _SafeStr_5800 = _arg_1;
        }


    }
}//package com.sulake.habbo.avatar.structure.parts

// _SafeStr_5798 = "_-op" (String#15726, DoABC#4)
// _SafeStr_5799 = "_-U1H" (String#15806, DoABC#4)
// _SafeStr_5800 = "_-bl" (String#11851, DoABC#4)
// _SafeStr_5801 = "_-EL" (String#22450, DoABC#4)
// _SafeStr_5802 = "_-02E" (String#11761, DoABC#4)


