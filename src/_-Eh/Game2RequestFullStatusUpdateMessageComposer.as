// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-EH.Game2RequestFullStatusUpdateMessageComposer

package _-EH
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class Game2RequestFullStatusUpdateMessageComposer implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function Game2RequestFullStatusUpdateMessageComposer(_arg_1:int)
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
}//package _-EH

// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


