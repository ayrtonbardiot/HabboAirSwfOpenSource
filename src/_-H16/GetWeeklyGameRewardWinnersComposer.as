// by nota

//_-H16.GetWeeklyGameRewardWinnersComposer

package _-H16
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class GetWeeklyGameRewardWinnersComposer implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function GetWeeklyGameRewardWinnersComposer(_arg_1:int)
        {
            _SafeStr_3740.push(_arg_1);
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


