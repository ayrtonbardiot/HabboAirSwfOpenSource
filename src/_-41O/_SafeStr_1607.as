// by nota

//_-41O._SafeStr_1607

package _-41O
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1607 
    {

        private var _SafeStr_7078:String;
        private var _SafeStr_7079:int;
        private var _SafeStr_7080:int;
        private var _SafeStr_4261:int;
        private var _SafeStr_3820:int;
        private var _SafeStr_7081:Boolean;
        private var _SafeStr_4028:String;
        private var _SafeStr_7082:String;
        private var _SafeStr_7083:int;
        private var _SafeStr_7084:String;
        private var _SafeStr_7085:int;
        private var _SafeStr_3692:int;
        private var _SafeStr_7086:int;
        private var _SafeStr_4794:int;
        private var _catalogPageName:String;
        private var _SafeStr_7087:String;
        private var _SafeStr_7088:Boolean;
        private var _SafeStr_7089:Date = new Date();

        public function _SafeStr_1607(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_7078 = _arg_1.readString();
            _SafeStr_7079 = _arg_1.readInteger();
            _SafeStr_7080 = _arg_1.readInteger();
            _SafeStr_4261 = _arg_1.readInteger();
            _SafeStr_3820 = _arg_1.readInteger();
            _SafeStr_7081 = _arg_1.readBoolean();
            _SafeStr_4028 = _arg_1.readString();
            _SafeStr_7082 = _arg_1.readString();
            _SafeStr_7083 = _arg_1.readInteger();
            _SafeStr_7084 = _arg_1.readString();
            _SafeStr_7085 = _arg_1.readInteger();
            _SafeStr_3692 = _arg_1.readInteger();
            _SafeStr_4794 = _arg_1.readInteger();
            _catalogPageName = _arg_1.readString();
            _SafeStr_7087 = _arg_1.readString();
            _SafeStr_7088 = _arg_1.readBoolean();
        }

        public static function getCampaignLocalizationKeyForCode(_arg_1:String):String
        {
            return ("quests." + _arg_1);
        }


        public function get campaignCode():String
        {
            return (_SafeStr_7078);
        }

        public function get localizationCode():String
        {
            return (_SafeStr_7084);
        }

        public function get completedQuestsInCampaign():int
        {
            return (_SafeStr_7079);
        }

        public function get questCountInCampaign():int
        {
            return (_SafeStr_7080);
        }

        public function get activityPointType():int
        {
            return (_SafeStr_4261);
        }

        public function get accepted():Boolean
        {
            return (_SafeStr_7081);
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get type():String
        {
            return (_SafeStr_4028);
        }

        public function get imageVersion():String
        {
            return (_SafeStr_7082);
        }

        public function get rewardCurrencyAmount():int
        {
            return (_SafeStr_7083);
        }

        public function get completedSteps():int
        {
            return (_SafeStr_7085);
        }

        public function get totalSteps():int
        {
            return (_SafeStr_3692);
        }

        public function get isCompleted():Boolean
        {
            return (_SafeStr_7085 == _SafeStr_3692);
        }

        public function get waitPeriodSeconds():int
        {
            if (_SafeStr_7086 < 1)
            {
                return (0);
            };
            var _local_1:Date = new Date();
            var _local_2:int = (_local_1.getTime() - _SafeStr_7089.getTime());
            return (int(Math.max(0, (_SafeStr_7086 - Math.floor((_local_2 / 1000))))));
        }

        public function getCampaignLocalizationKey():String
        {
            return (getCampaignLocalizationKeyForCode(campaignCode));
        }

        public function getQuestLocalizationKey():String
        {
            return ((this.getCampaignLocalizationKey() + ".") + _SafeStr_7084);
        }

        public function get completedCampaign():Boolean
        {
            return (_SafeStr_3820 < 1);
        }

        public function set id(_arg_1:int):void
        {
            _SafeStr_3820 = _arg_1;
        }

        public function set accepted(_arg_1:Boolean):void
        {
            _SafeStr_7081 = _arg_1;
        }

        public function get lastQuestInCampaign():Boolean
        {
            return (_SafeStr_7079 >= _SafeStr_7080);
        }

        public function get receiveTime():Date
        {
            return (_SafeStr_7089);
        }

        public function set waitPeriodSeconds(_arg_1:int):void
        {
            _SafeStr_7086 = _arg_1;
        }

        public function get sortOrder():int
        {
            return (_SafeStr_4794);
        }

        public function get catalogPageName():String
        {
            return (_catalogPageName);
        }

        public function get chainCode():String
        {
            return (_SafeStr_7087);
        }

        public function get easy():Boolean
        {
            return (_SafeStr_7088);
        }


    }
}//package _-41O

// _SafeStr_1607 = "_-oH" (String#9950, DoABC#3)
// _SafeStr_3692 = "_-Ww" (String#8760, DoABC#3)
// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)
// _SafeStr_4028 = "_-81R" (String#7081, DoABC#3)
// _SafeStr_4261 = "_-m1a" (String#9806, DoABC#3)
// _SafeStr_4794 = "_-Wt" (String#8757, DoABC#3)
// _SafeStr_7078 = "_-o9" (String#9945, DoABC#3)
// _SafeStr_7079 = "_-02v" (String#6525, DoABC#3)
// _SafeStr_7080 = "_-D12" (String#7413, DoABC#3)
// _SafeStr_7081 = "_-r1T" (String#10128, DoABC#3)
// _SafeStr_7082 = "_-D1Y" (String#7427, DoABC#3)
// _SafeStr_7083 = "_-41A" (String#6802, DoABC#3)
// _SafeStr_7084 = "_-iB" (String#9552, DoABC#3)
// _SafeStr_7085 = "_-i1O" (String#9528, DoABC#3)
// _SafeStr_7086 = "_-8E" (String#7119, DoABC#3)
// _SafeStr_7087 = "_-Z8" (String#8930, DoABC#3)
// _SafeStr_7088 = "_-V1c" (String#8624, DoABC#3)
// _SafeStr_7089 = "_-sA" (String#10212, DoABC#3)


