// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.structure.animation.AnimationFrame

package com.sulake.habbo.avatar.structure.animation
{
    public class AnimationFrame 
    {

        private var _SafeStr_6337:int;
        private var _assetPartDefinition:String;

        public function AnimationFrame(_arg_1:XML)
        {
            _SafeStr_6337 = parseInt(_arg_1.@number);
            _assetPartDefinition = _arg_1.@assetpartdefinition;
        }

        public function get number():int
        {
            return (_SafeStr_6337);
        }

        public function get assetPartDefinition():String
        {
            return (_assetPartDefinition);
        }


    }
}//package com.sulake.habbo.avatar.structure.animation

// _SafeStr_6337 = "_-iL" (String#7169, DoABC#4)


