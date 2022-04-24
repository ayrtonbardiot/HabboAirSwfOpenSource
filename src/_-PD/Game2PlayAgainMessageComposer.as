// by nota

//_-PD.Game2PlayAgainMessageComposer

package _-PD
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class Game2PlayAgainMessageComposer implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];


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


