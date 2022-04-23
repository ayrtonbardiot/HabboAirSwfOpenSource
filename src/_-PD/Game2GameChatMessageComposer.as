// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-PD.Game2GameChatMessageComposer

package _-PD
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class Game2GameChatMessageComposer implements IMessageComposer 
    {

        private var _SafeStr_7499:String;

        public function Game2GameChatMessageComposer(_arg_1:String)
        {
            _SafeStr_7499 = _arg_1;
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_7499]);
        }

        public function dispose():void
        {
            _SafeStr_7499 = null;
        }


    }
}//package _-PD

// _SafeStr_7499 = "_-Hl" (String#7708, DoABC#3)


