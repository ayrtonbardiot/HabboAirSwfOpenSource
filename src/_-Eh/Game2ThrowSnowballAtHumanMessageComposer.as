// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-EH.Game2ThrowSnowballAtHumanMessageComposer

package _-EH
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class Game2ThrowSnowballAtHumanMessageComposer implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function Game2ThrowSnowballAtHumanMessageComposer(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int)
        {
            _SafeStr_3740.push(_arg_1);
            _SafeStr_3740.push(_arg_2);
            _SafeStr_3740.push(_arg_3);
            _SafeStr_3740.push(_arg_4);
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
}//package _-EH

// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


