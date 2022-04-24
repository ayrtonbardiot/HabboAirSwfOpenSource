// by nota

//_-41O._SafeStr_1650

package _-41O
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1650 
    {

        private var _SafeStr_7090:int;
        private var _SafeStr_7091:String;
        private var _SafeStr_7092:int;
        private var _SafeStr_7093:String;
        private var _SafeStr_7094:Boolean;
        private var _localizedName:String;

        public function _SafeStr_1650(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_7090 = _arg_1.readInteger();
            _SafeStr_7091 = _arg_1.readString();
            _SafeStr_7092 = _arg_1.readInteger();
            _SafeStr_7093 = _arg_1.readString();
            _SafeStr_7094 = _arg_1.readBoolean();
            _localizedName = _arg_1.readString();
        }

        public function get communityGoalId():int
        {
            return (_SafeStr_7090);
        }

        public function get communityGoalCode():String
        {
            return (_SafeStr_7091);
        }

        public function get userRank():int
        {
            return (_SafeStr_7092);
        }

        public function get rewardCode():String
        {
            return (_SafeStr_7093);
        }

        public function get badge():Boolean
        {
            return (_SafeStr_7094);
        }

        public function get localizedName():String
        {
            return (_localizedName);
        }


    }
}//package _-41O

// _SafeStr_1650 = "_-OQ" (String#8179, DoABC#3)
// _SafeStr_7090 = "_-20" (String#6623, DoABC#3)
// _SafeStr_7091 = "_-z1U" (String#10663, DoABC#3)
// _SafeStr_7092 = "_-E1L" (String#7470, DoABC#3)
// _SafeStr_7093 = "_-L1I" (String#7941, DoABC#3)
// _SafeStr_7094 = "_-y1w" (String#10602, DoABC#3)


