// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-wo.WeeklyGameRewardWinnersEvent

package _-wo
{
    import com.sulake.core.communication.messages.MessageEvent;
    import _-d1Q._SafeStr_1481;

    public class WeeklyGameRewardWinnersEvent extends MessageEvent 
    {

        public function WeeklyGameRewardWinnersEvent(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1481);
        }

        public function getParser():_SafeStr_1481
        {
            return (this._SafeStr_7012 as _SafeStr_1481);
        }


    }
}//package _-wo

// _SafeStr_1481 = "_-b1T" (String#9052, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


