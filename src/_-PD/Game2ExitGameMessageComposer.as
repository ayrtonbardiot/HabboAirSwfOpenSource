// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-PD.Game2ExitGameMessageComposer

package _-PD
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class Game2ExitGameMessageComposer implements IMessageComposer 
    {

        private var _SafeStr_7498:Boolean;

        public function Game2ExitGameMessageComposer(_arg_1:Boolean=true)
        {
            _SafeStr_7498 = _arg_1;
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_7498]);
        }

        public function dispose():void
        {
        }


    }
}//package _-PD

// _SafeStr_7498 = "_-LO" (String#7971, DoABC#3)


