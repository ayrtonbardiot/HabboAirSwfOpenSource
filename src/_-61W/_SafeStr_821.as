// by nota

//_-61W._SafeStr_821

package _-61W
{
    import com.sulake.core.communication.messages.MessageEvent;
    import _-221._SafeStr_1262;

    [SecureSWF(rename="true")]
    public class _SafeStr_821 extends MessageEvent 
    {

        public function _SafeStr_821(_arg_1:Function, _arg_2:Class)
        {
            super(_arg_1, _arg_2);
        }

        public function get firstUserID():int
        {
            return (getParser().firstUserID);
        }

        public function get secondUserID():int
        {
            return (getParser().secondUserID);
        }

        public function get firstUserNumItems():int
        {
            return (getParser().firstUserNumItems);
        }

        public function get secondUserNumItems():int
        {
            return (getParser().secondUserNumItems);
        }

        public function get firstUserNumCredits():int
        {
            return (getParser().firstUserNumCredits);
        }

        public function get secondUserNumCredits():int
        {
            return (getParser().secondUserNumCredits);
        }

        public function get firstUserItemArray():Array
        {
            return (getParser().firstUserItemArray);
        }

        public function get secondUserItemArray():Array
        {
            return (getParser().secondUserItemArray);
        }

        public function getParser():_SafeStr_1262
        {
            return (_SafeStr_7012 as _SafeStr_1262);
        }


    }
}//package _-61W

// _SafeStr_1262 = "_-f1G" (String#9330, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_821 = "_-41v" (String#6837, DoABC#3)


