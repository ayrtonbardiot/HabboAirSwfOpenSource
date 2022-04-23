// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.sound.trax.TraxChannelSample

package com.sulake.habbo.sound.trax
{
    import __AS3__.vec.Vector;

    public class TraxChannelSample 
    {

        private var _SafeStr_5643:TraxSample = null;
        private var _offset:int = 0;

        public function TraxChannelSample(_arg_1:TraxSample, _arg_2:int)
        {
            _SafeStr_5643 = _arg_1;
            _offset = _arg_2;
        }

        public function setSample(_arg_1:Vector.<int>, _arg_2:int, _arg_3:int):void
        {
            _offset = _SafeStr_5643.setSample(_arg_1, _arg_2, _arg_3, _offset);
        }

        public function addSample(_arg_1:Vector.<int>, _arg_2:int, _arg_3:int):void
        {
            _offset = _SafeStr_5643.addSample(_arg_1, _arg_2, _arg_3, _offset);
        }


    }
}//package com.sulake.habbo.sound.trax

// _SafeStr_5643 = "_-S1E" (String#13831, DoABC#4)


