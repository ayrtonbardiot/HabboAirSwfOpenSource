// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-wo.WeeklyGameRewardEvent

package _-wo
{
    import com.sulake.core.communication.messages.MessageEvent;
    import _-d1Q._SafeStr_1373;

    public class WeeklyGameRewardEvent extends MessageEvent 
    {

        public function WeeklyGameRewardEvent(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1373);
        }

        public function getParser():_SafeStr_1373
        {
            return (this._SafeStr_7012 as _SafeStr_1373);
        }


    }
}//package _-wo

// _SafeStr_1373 = "_-H1B" (String#7662, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


