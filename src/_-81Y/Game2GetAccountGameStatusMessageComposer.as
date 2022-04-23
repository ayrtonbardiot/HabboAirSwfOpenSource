// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-81Y.Game2GetAccountGameStatusMessageComposer

package _-81Y
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class Game2GetAccountGameStatusMessageComposer implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function Game2GetAccountGameStatusMessageComposer(_arg_1:int)
        {
            _SafeStr_3740.push(_arg_1);
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_3740);
        }

        public function dispose():void
        {
        }


    }
}//package _-81Y

// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


