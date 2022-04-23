// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.roomevents.userdefinedroomevents.conditions.ConditionTypes

package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
    import com.sulake.habbo.roomevents.userdefinedroomevents._SafeStr_3326;
    import com.sulake.habbo.roomevents.userdefinedroomevents._SafeStr_3285;
    import _-l12._SafeStr_1555;
    import _-l12._SafeStr_1554;

    public class ConditionTypes implements _SafeStr_3326 
    {

        private var _SafeStr_6283:Array = [];

        public function ConditionTypes()
        {
            this._SafeStr_6283.push(new _SafeStr_3433());
            this._SafeStr_6283.push(new FurnisHaveAvatars());
            this._SafeStr_6283.push(new _SafeStr_3456());
            this._SafeStr_6283.push(new _SafeStr_3400());
            this._SafeStr_6283.push(new _SafeStr_3459());
            this._SafeStr_6283.push(new _SafeStr_3452());
            this._SafeStr_6283.push(new _SafeStr_3469());
            this._SafeStr_6283.push(new HasStackedFurnis());
            this._SafeStr_6283.push(new _SafeStr_3439());
            this._SafeStr_6283.push(new StuffsInFormation());
            this._SafeStr_6283.push(new _SafeStr_3398());
            this._SafeStr_6283.push(new _SafeStr_3415());
            this._SafeStr_6283.push(new _SafeStr_3410());
            this._SafeStr_6283.push(new DontHaveStackedFurnis());
            this._SafeStr_6283.push(new _SafeStr_3414());
            this._SafeStr_6283.push(new _SafeStr_3466());
        }

        public function get types():Array
        {
            return (_SafeStr_6283);
        }

        public function getByCode(_arg_1:int):_SafeStr_3397
        {
            for each (var _local_2:_SafeStr_3397 in _SafeStr_6283)
            {
                if (_local_2.code == _arg_1)
                {
                    return (_local_2);
                };
                if (_local_2.negativeCode == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (null);
        }

        public function getElementByCode(_arg_1:int):_SafeStr_3285
        {
            return (getByCode(_arg_1));
        }

        public function acceptTriggerable(_arg_1:_SafeStr_1554):Boolean
        {
            return (!((_arg_1 as _SafeStr_1555) == null));
        }

        public function getKey():String
        {
            return ("condition");
        }


    }
}//package com.sulake.habbo.roomevents.userdefinedroomevents.conditions

// _SafeStr_1554 = "_-W1B" (String#2019, DoABC#4)
// _SafeStr_1555 = "_-IL" (String#23531, DoABC#4)
// _SafeStr_3285 = "_-j1k" (String#3139, DoABC#4)
// _SafeStr_3326 = "_-L17" (String#8542, DoABC#4)
// _SafeStr_3397 = "_-02u" (String#13716, DoABC#4)
// _SafeStr_3398 = "_-rE" (String#14088, DoABC#4)
// _SafeStr_3400 = "_-g1g" (String#15549, DoABC#4)
// _SafeStr_3410 = "_-s1G" (String#15760, DoABC#4)
// _SafeStr_3414 = "_-M15" (String#15182, DoABC#4)
// _SafeStr_3415 = "_-g17" (String#15785, DoABC#4)
// _SafeStr_3433 = "_-I1b" (String#14424, DoABC#4)
// _SafeStr_3439 = "_-68" (String#14934, DoABC#4)
// _SafeStr_3452 = "_-ri" (String#15574, DoABC#4)
// _SafeStr_3456 = "_-k1Q" (String#15734, DoABC#4)
// _SafeStr_3459 = "_-pd" (String#14948, DoABC#4)
// _SafeStr_3466 = "_-11w" (String#15749, DoABC#4)
// _SafeStr_3469 = "_-5b" (String#14744, DoABC#4)
// _SafeStr_6283 = "_-q1v" (String#1597, DoABC#4)


