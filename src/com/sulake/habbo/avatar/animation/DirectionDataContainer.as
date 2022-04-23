// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.animation.DirectionDataContainer

package com.sulake.habbo.avatar.animation
{
    public class DirectionDataContainer 
    {

        private var _offset:int;

        public function DirectionDataContainer(_arg_1:XML)
        {
            _offset = parseInt(_arg_1.@offset);
        }

        public function get offset():int
        {
            return (_offset);
        }


    }
}//package com.sulake.habbo.avatar.animation

