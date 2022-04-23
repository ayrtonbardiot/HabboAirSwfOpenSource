// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.moderation.IssueBundle

package com.sulake.habbo.moderation
{
    import com.sulake.core.utils._SafeStr_24;
    import _-V1k._SafeStr_1616;

    public class IssueBundle 
    {

        private var _SafeStr_3820:int;
        private var _SafeStr_4994:_SafeStr_24;
        private var _SafeStr_3734:int;
        private var _SafeStr_6383:int = 0;
        private var _pickerName:String = "";
        private var _SafeStr_5240:int;
        private var _SafeStr_6384:int;
        private var _SafeStr_6385:int = 0;
        private var _SafeStr_6387:int = 0;
        private var _SafeStr_6386:_SafeStr_1616 = null;
        private var _highestPriorityIssue:_SafeStr_1616 = null;

        public function IssueBundle(_arg_1:int, _arg_2:_SafeStr_1616)
        {
            _SafeStr_3820 = _arg_1;
            _SafeStr_4994 = new _SafeStr_24();
            _SafeStr_3734 = _arg_2.state;
            _SafeStr_6383 = _arg_2.pickerUserId;
            _pickerName = _arg_2.pickerUserName;
            _SafeStr_5240 = _arg_2.reportedUserId;
            _SafeStr_6384 = _arg_2.groupingId;
            addIssue(_arg_2);
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get issues():Array
        {
            return (_SafeStr_4994.getValues());
        }

        public function get state():int
        {
            return (_SafeStr_3734);
        }

        public function get pickerUserId():int
        {
            return (_SafeStr_6383);
        }

        public function get pickerName():String
        {
            return (_pickerName);
        }

        public function matches(_arg_1:_SafeStr_1616, _arg_2:Boolean=false):Boolean
        {
            if (((_SafeStr_6384 == 0) || (_arg_1.groupingId == 0)))
            {
                return (false);
            };
            if (((!(_SafeStr_6384 == _arg_1.groupingId)) || (!(_SafeStr_5240 == _arg_1.reportedUserId))))
            {
                return (false);
            };
            if (!_arg_2)
            {
                if (state != _arg_1.state)
                {
                    return (false);
                };
                if (pickerUserId != _arg_1.pickerUserId)
                {
                    return (false);
                };
            };
            return (true);
        }

        public function contains(_arg_1:int):Boolean
        {
            if (_SafeStr_4994 == null)
            {
                return (false);
            };
            return (_SafeStr_4994.getKeys().indexOf(_arg_1) > -1);
        }

        public function updateIssue(_arg_1:_SafeStr_1616):void
        {
            removeIssue(_arg_1.issueId);
            addIssue(_arg_1);
        }

        private function addIssue(_arg_1:_SafeStr_1616):void
        {
            _SafeStr_4994.add(_arg_1.issueId, _arg_1);
            _SafeStr_6387 = _arg_1.issueAgeInMilliseconds;
            if (((!(_arg_1.message == null)) && (!(_arg_1.message == ""))))
            {
                _SafeStr_6385++;
            };
            if (((_SafeStr_6386 == null) || (_arg_1.issueAgeInMilliseconds > _SafeStr_6386.issueAgeInMilliseconds)))
            {
                _SafeStr_6386 = _arg_1;
            };
            _highestPriorityIssue = null;
            getHighestPriorityIssue();
        }

        public function removeIssue(_arg_1:int):_SafeStr_1616
        {
            var _local_2:_SafeStr_1616 = (_SafeStr_4994.remove(_arg_1) as _SafeStr_1616);
            if (_local_2 != null)
            {
                if (((!(_local_2.message == null)) && (!(_local_2.message == ""))))
                {
                    _SafeStr_6385--;
                };
                if (_SafeStr_6386 == _local_2)
                {
                    _SafeStr_6386 = null;
                };
                if (_highestPriorityIssue == _local_2)
                {
                    _highestPriorityIssue = null;
                };
            };
            return (_local_2);
        }

        public function get highestPriority():int
        {
            if (_highestPriorityIssue == null)
            {
                getHighestPriorityIssue();
            };
            if (_highestPriorityIssue != null)
            {
                return (_highestPriorityIssue.priority);
            };
            return (0);
        }

        public function getHighestPriorityIssue():_SafeStr_1616
        {
            var _local_3:* = null;
            var _local_4:* = null;
            var _local_2:int;
            var _local_1:* = null;
            var _local_5:Boolean;
            if (_highestPriorityIssue == null)
            {
                if (((_SafeStr_4994 == null) || (_SafeStr_4994.length < 1)))
                {
                    return (null);
                };
                _local_2 = 0;
                while (_local_2 < _SafeStr_4994.length)
                {
                    _local_1 = _SafeStr_4994.getWithIndex(_local_2);
                    _local_5 = ((_local_1.reportedCategoryId > 0) && (_local_1.reportedCategoryId < 100));
                    if (_local_5)
                    {
                        if (((_local_4 == null) || (_local_4.priority > _local_1.priority)))
                        {
                            _local_4 = _local_1;
                        };
                    }
                    else
                    {
                        if (((_local_3 == null) || (_local_3.priority > _local_1.priority)))
                        {
                            _local_3 = _local_1;
                        };
                    };
                    _local_2++;
                };
                if (_local_4 != null)
                {
                    _highestPriorityIssue = _local_4;
                }
                else
                {
                    _highestPriorityIssue = _local_3;
                };
            };
            return (_highestPriorityIssue);
        }

        public function getIssueCount():int
        {
            if (_SafeStr_4994 == null)
            {
                return (0);
            };
            return (_SafeStr_4994.length);
        }

        public function getIssueIds():Array
        {
            if (_SafeStr_4994 == null)
            {
                return ([]);
            };
            return (_SafeStr_4994.getKeys());
        }

        public function get reportedUserId():int
        {
            return (_SafeStr_5240);
        }

        public function getMessageCount():int
        {
            return (_SafeStr_6385);
        }

        public function get issueAgeInMilliseconds():int
        {
            return (_SafeStr_6387);
        }

        public function getOpenTime(_arg_1:int):String
        {
            var _local_2:* = null;
            var _local_3:_SafeStr_1616 = _SafeStr_6386;
            if (_local_3 == null)
            {
                for each (_local_2 in _SafeStr_4994)
                {
                    if (((_local_3 == null) || (_local_2.issueAgeInMilliseconds > _local_3.issueAgeInMilliseconds)))
                    {
                        _local_3 = _local_2;
                    };
                };
                _SafeStr_6386 = _local_3;
            };
            if (_local_3 != null)
            {
                return (_local_3.getOpenTime(_arg_1));
            };
            return ("");
        }


    }
}//package com.sulake.habbo.moderation

// _SafeStr_1616 = "_-Jg" (String#2516, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3734 = "_-g1U" (String#198, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_4994 = "_-XA" (String#3122, DoABC#4)
// _SafeStr_5240 = "_-T19" (String#2194, DoABC#4)
// _SafeStr_6383 = "_-O12" (String#21300, DoABC#4)
// _SafeStr_6384 = "_-ow" (String#15446, DoABC#4)
// _SafeStr_6385 = "_-71K" (String#9869, DoABC#4)
// _SafeStr_6386 = "_-01E" (String#6821, DoABC#4)
// _SafeStr_6387 = "_-11r" (String#20702, DoABC#4)


