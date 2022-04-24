// by nota

//_-H16.Game2GetWeeklyLeaderboardComposer

package _-H16
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class Game2GetWeeklyLeaderboardComposer implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function Game2GetWeeklyLeaderboardComposer(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:int)
        {
            _SafeStr_3740.push(_arg_1);
            _SafeStr_3740.push(_arg_2);
            _SafeStr_3740.push(_arg_3);
            _SafeStr_3740.push(_arg_4);
            _SafeStr_3740.push(_arg_5);
            _SafeStr_3740.push(_arg_6);
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_3740);
        }

        public function dispose():void
        {
            _SafeStr_3740 = null;
        }


    }
}//package _-H16

// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


