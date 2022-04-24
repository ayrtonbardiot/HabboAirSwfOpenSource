// by nota

//_-IU.GetUserGameAchievementsMessageComposer

package _-IU
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class GetUserGameAchievementsMessageComposer implements IMessageComposer 
    {

        private var _SafeStr_7127:int;

        public function GetUserGameAchievementsMessageComposer(_arg_1:int)
        {
            _SafeStr_7127 = _arg_1;
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_7127]);
        }

        public function dispose():void
        {
        }


    }
}//package _-IU

// _SafeStr_7127 = "_-co" (String#9157, DoABC#3)


