// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-H16.GetWeeklyCompetitiveLeaderboardComposer

package _-H16
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class GetWeeklyCompetitiveLeaderboardComposer implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function GetWeeklyCompetitiveLeaderboardComposer(_arg_1:int, _arg_2:int)
        {
            _SafeStr_3740.push(_arg_1);
            _SafeStr_3740.push(_arg_2);
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


