﻿// by nota

//_-PD.Game2LoadStageReadyMessageComposer

package _-PD
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class Game2LoadStageReadyMessageComposer implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function Game2LoadStageReadyMessageComposer(_arg_1:int)
        {
            _SafeStr_3740.push(_arg_1);
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_3740);
        }

        public function dispose():void
        {
            _SafeStr_3740 = [];
        }


    }
}//package _-PD

// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


