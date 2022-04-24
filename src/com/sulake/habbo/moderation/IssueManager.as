// by nota

//com.sulake.habbo.moderation.IssueManager

package com.sulake.habbo.moderation
{
    import com.sulake.core.utils._SafeStr_24;
    import flash.utils.Timer;
    import __AS3__.vec.Vector;
    import _-v1p._SafeStr_1638;
    import _-2s._SafeStr_334;
    import _-V1k._SafeStr_1616;
    import flash.events.Event;
    import _-2s._SafeStr_734;
    import com.sulake.habbo.utils.StringUtil;
    import _-v1p._SafeStr_1636;
    import _-2s._SafeStr_476;
    import _-2s._SafeStr_996;
    import _-2s._SafeStr_784;

    public class IssueManager 
    {

        public static const _SafeStr_8646:String = "issue_bundle_open";
        public static const BUNDLE_MY:String = "issue_bundle_my";
        public static const _SafeStr_8647:String = "issue_bundle_picked";
        public static const PRIORITY_UPDATE_INTERVAL_MS:int = 15000;
        public static const RESOLUTION_USELESS:int = 1;
        public static const RESOLUTION_RESOLVED:int = 3;

        private var _moderationManager:ModerationManager;
        private var _SafeStr_4990:IssueBrowser;
        private var _SafeStr_4994:_SafeStr_24;
        private var _SafeStr_4991:_SafeStr_24;
        private var _SafeStr_4995:_SafeStr_24;
        private var _SafeStr_4992:Array;
        private var _SafeStr_4993:Array;
        private var _issueHandlers:_SafeStr_24;
        private var _SafeStr_4997:_SafeStr_24;
        private var _SafeStr_4996:int = 1;
        private var _SafeStr_8648:int;
        private var _SafeStr_4988:Timer;
        private var _SafeStr_4989:int;
        private var _SafeStr_4999:int;
        private var _SafeStr_5000:int;
        private var _windowWidth:int;
        private var _SafeStr_5001:int;
        private var _SafeStr_4998:Vector.<_SafeStr_1638>;

        public function IssueManager(_arg_1:ModerationManager)
        {
            _moderationManager = _arg_1;
            _SafeStr_4994 = new _SafeStr_24();
            _SafeStr_4991 = new _SafeStr_24();
            _SafeStr_4995 = new _SafeStr_24();
            _SafeStr_4990 = new IssueBrowser(this, _moderationManager.windowManager, _moderationManager.assets);
            _SafeStr_4992 = [];
            _SafeStr_4993 = [];
            _issueHandlers = new _SafeStr_24();
            _SafeStr_4997 = new _SafeStr_24();
            _SafeStr_8648 = _moderationManager.getInteger("chf.score.updatefactor", 60);
            _SafeStr_4989 = _moderationManager.getInteger("max.call_for_help.results", 200);
            _SafeStr_4988 = new Timer(15000, 0);
            _SafeStr_4988.addEventListener("timer", updateIssueBrowser);
            _SafeStr_4988.start();
        }

        public function get issueListLimit():int
        {
            return (_SafeStr_4989);
        }

        public function init():void
        {
            _SafeStr_4990.show();
        }

        public function pickBundle(_arg_1:int, _arg_2:String, _arg_3:Boolean=false, _arg_4:int=0):void
        {
            var _local_5:IssueBundle = (_SafeStr_4991.getValue(_arg_1) as IssueBundle);
            if (_local_5 == null)
            {
                return;
            };
            sendPick(_local_5.getIssueIds(), _arg_3, _arg_4, _arg_2);
            _SafeStr_4992 = _SafeStr_4992.concat(_local_5.getIssueIds());
        }

        public function autoPick(_arg_1:String, _arg_2:Boolean=false, _arg_3:int=0):void
        {
            var _local_4:* = null;
            var _local_6:* = null;
            var _local_5:Array = _SafeStr_4991.getValues();
            for each (_local_6 in _local_5)
            {
                if (((_local_6.state == 1) && ((_local_4 == null) || (isBundleHigherPriorityOrOlder(_local_6, _local_4)))))
                {
                    _local_4 = _local_6;
                };
            };
            if (_local_4 == null)
            {
                return;
            };
            pickBundle(_local_4.id, _arg_1, _arg_2, _arg_3);
        }

        private function isBundleHigherPriorityOrOlder(_arg_1:IssueBundle, _arg_2:IssueBundle):Boolean
        {
            if (_arg_1.highestPriority < _arg_2.highestPriority)
            {
                return (true);
            };
            return ((_arg_1.highestPriority == _arg_2.highestPriority) && (_arg_1.issueAgeInMilliseconds < _arg_2.issueAgeInMilliseconds));
        }

        public function releaseAll():void
        {
            var _local_3:* = null;
            if (_SafeStr_4991 == null)
            {
                return;
            };
            var _local_1:int = _moderationManager.sessionDataManager.userId;
            var _local_2:Array = [];
            for each (_local_3 in _SafeStr_4991)
            {
                if (((_local_3.state == 2) && (_local_3.pickerUserId == _local_1)))
                {
                    _local_2 = _local_2.concat(_local_3.getIssueIds());
                };
            };
            sendRelease(_local_2);
        }

        public function releaseBundle(_arg_1:int):void
        {
            if (_SafeStr_4991 == null)
            {
                return;
            };
            var _local_2:IssueBundle = (_SafeStr_4991.getValue(_arg_1) as IssueBundle);
            if (_local_2 == null)
            {
                return;
            };
            sendRelease(_local_2.getIssueIds());
        }

        private function sendRelease(_arg_1:Array):void
        {
            if (((((_arg_1 == null) || (_arg_1.length == 0)) || (_moderationManager == null)) || (_moderationManager.connection == null)))
            {
                return;
            };
            _moderationManager.connection.send(new _SafeStr_334(_arg_1));
            _SafeStr_4993 = _SafeStr_4993.concat(_arg_1);
        }

        public function playSound(_arg_1:_SafeStr_1616):void
        {
            if (_SafeStr_4994[_arg_1.issueId] != null)
            {
                return;
            };
            if (((_SafeStr_4990 == null) || (!(_SafeStr_4990.isOpen()))))
            {
                _moderationManager.soundManager.playSound("HBST_call_for_help");
            };
        }

        public function updateIssue(_arg_1:_SafeStr_1616):void
        {
            var _local_9:* = null;
            var _local_3:* = null;
            var _local_2:int;
            var _local_4:* = null;
            var _local_5:Boolean;
            var _local_7:* = null;
            var _local_8:int;
            if (_arg_1 == null)
            {
                return;
            };
            _SafeStr_4994.remove(_arg_1.issueId);
            _SafeStr_4994.add(_arg_1.issueId, _arg_1);
            var _local_6:int = _SafeStr_4995.getValue(_arg_1.issueId);
            if (_local_6 != 0)
            {
                _local_9 = (_SafeStr_4991.getValue(_local_6) as IssueBundle);
                if (_local_9 != null)
                {
                    if (_local_9.matches(_arg_1))
                    {
                        _local_9.updateIssue(_arg_1);
                    }
                    else
                    {
                        _local_9.removeIssue(_arg_1.issueId);
                        if (_local_9.getIssueCount() == 0)
                        {
                            _SafeStr_4991.remove(_local_9.id);
                            removeHandler(_local_9.id);
                        };
                        _SafeStr_4995.remove(_arg_1.issueId);
                        _local_9 = null;
                    };
                };
            };
            if (_arg_1.state == 3)
            {
                _SafeStr_4994.remove(_arg_1.issueId);
                return;
            };
            if (_local_9 == null)
            {
                for each (_local_3 in _SafeStr_4991)
                {
                    if (_local_3.matches(_arg_1))
                    {
                        _local_9 = _local_3;
                        _local_9.updateIssue(_arg_1);
                        _SafeStr_4995.add(_arg_1.issueId, _local_9.id);
                        break;
                    };
                };
            };
            if (_local_9 == null)
            {
                _local_6 = _SafeStr_4996++;
                _local_9 = new IssueBundle(_local_6, _arg_1);
                _SafeStr_4995.add(_arg_1.issueId, _local_6);
                _SafeStr_4991.add(_local_6, _local_9);
            };
            if (_local_9 == null)
            {
                return;
            };
            if (_SafeStr_4992.indexOf(_arg_1.issueId) != -1)
            {
                handleBundle(_local_9.id);
                _local_2 = _moderationManager.sessionDataManager.userId;
                if (_local_2 != _arg_1.pickerUserId)
                {
                    if (_arg_1.state == 2)
                    {
                        unhandleBundle(_local_9.id);
                    };
                };
            };
            if (_arg_1.state == 1)
            {
                _local_4 = getBundles("issue_bundle_my");
                _local_5 = false;
                for each (_local_7 in _local_4)
                {
                    if (_local_7.matches(_arg_1, true))
                    {
                        _local_5 = true;
                        break;
                    };
                };
                _local_8 = _SafeStr_4993.indexOf(_arg_1.issueId);
                if (((_local_8 == -1) && (_local_5)))
                {
                    sendPick([_arg_1.issueId], false, 0, ("matches bundle with issue: " + _local_7.getHighestPriorityIssue().issueId));
                }
                else
                {
                    _SafeStr_4993.splice(_local_8, 1);
                };
            };
            updateHandler(_local_9.id);
            _SafeStr_4990.update();
        }

        public function updateIssueBrowser(_arg_1:Event=null):void
        {
            if (_moderationManager == null)
            {
                return;
            };
            if (_SafeStr_4990 != null)
            {
                _SafeStr_4990.update();
            };
        }

        private function updateHandler(_arg_1:int):void
        {
            var _local_2:IIssueHandler = _issueHandlers.getValue(_arg_1);
            if (_local_2 != null)
            {
                _local_2.updateIssuesAndMessages();
            };
        }

        public function removeHandler(_arg_1:int):void
        {
            var _local_2:IIssueHandler = _issueHandlers.remove(_arg_1);
            if (_local_2 != null)
            {
                _local_2.dispose();
                _local_2 = null;
            };
        }

        public function addModActionView(_arg_1:int, _arg_2:ModActionCtrl):void
        {
            _SafeStr_4997.add(_arg_1, _arg_2);
        }

        public function removeModActionView(_arg_1:int):void
        {
            _SafeStr_4997.remove(_arg_1);
        }

        public function removeIssue(_arg_1:int):void
        {
            var _local_3:* = null;
            if (_SafeStr_4994 == null)
            {
                return;
            };
            var _local_2:int = _SafeStr_4995.getValue(_arg_1);
            if (_local_2 != 0)
            {
                _local_3 = (_SafeStr_4991.getValue(_local_2) as IssueBundle);
                if (_local_3 != null)
                {
                    _local_3.removeIssue(_arg_1);
                    if (_local_3.getIssueCount() == 0)
                    {
                        _SafeStr_4991.remove(_local_3.id);
                    };
                };
            };
            _SafeStr_4994.remove(_arg_1);
            _SafeStr_4990.update();
        }

        public function getBundles(_arg_1:String):Array
        {
            var _local_4:* = null;
            if (_SafeStr_4991 == null)
            {
                return ([]);
            };
            var _local_3:Array = [];
            var _local_2:int = _moderationManager.sessionDataManager.userId;
            for each (_local_4 in _SafeStr_4991)
            {
                switch (_arg_1)
                {
                    case "issue_bundle_open":
                        if (_local_4.state == 1)
                        {
                            _local_3.push(_local_4);
                        };
                        break;
                    case "issue_bundle_my":
                        if (((_local_4.state == 2) && (_local_4.pickerUserId == _local_2)))
                        {
                            _local_3.push(_local_4);
                        };
                        break;
                    case "issue_bundle_picked":
                        if (((_local_4.state == 2) && (!(_local_4.pickerUserId == _local_2))))
                        {
                            _local_3.push(_local_4);
                        };
                };
            };
            return (_local_3);
        }

        public function handleBundle(_arg_1:int):void
        {
            var _local_5:IssueBundle = (_SafeStr_4991.getValue(_arg_1) as IssueBundle);
            if (_local_5 == null)
            {
                return;
            };
            var _local_4:IIssueHandler = new IssueHandler(_moderationManager, _local_5, _SafeStr_4998, _SafeStr_4999, _SafeStr_5000, _windowWidth, _SafeStr_5001);
            _moderationManager.windowTracker.show((_local_4 as ITrackedWindow), null, false, false, false, true, _SafeStr_4999, _SafeStr_5000, _windowWidth, _SafeStr_5001);
            removeHandler(_arg_1);
            _issueHandlers.add(_arg_1, _local_4);
            var _local_2:Array = [];
            for each (var _local_3:int in _SafeStr_4992)
            {
                if (!_local_5.contains(_local_3))
                {
                    _local_2 = _local_2.concat(_local_3);
                };
            };
            _SafeStr_4992 = _local_2;
        }

        public function unhandleBundle(_arg_1:int):void
        {
            var _local_3:IssueBundle = (_SafeStr_4991.getValue(_arg_1) as IssueBundle);
            if (_local_3 == null)
            {
                return;
            };
            var _local_2:ITrackedWindow = _issueHandlers.remove(_arg_1);
            if (_local_2 != null)
            {
                _local_2.dispose();
            };
        }

        public function closeBundle(_arg_1:int, _arg_2:int):void
        {
            var _local_3:IssueBundle = (_SafeStr_4991.getValue(_arg_1) as IssueBundle);
            if (_local_3 == null)
            {
                return;
            };
            sendClose(_local_3.getIssueIds(), _arg_2);
        }

        public function closeDefaultAction(_arg_1:int, _arg_2:int):void
        {
            var _local_6:IssueBundle = (_SafeStr_4991.getValue(_arg_1) as IssueBundle);
            if (_local_6 == null)
            {
                return;
            };
            var _local_5:int = _local_6.getHighestPriorityIssue().issueId;
            var _local_4:Array = [];
            for each (var _local_3:int in _local_6.getIssueIds())
            {
                if (_local_3 != _local_5)
                {
                    _local_4.push(_local_3);
                };
            };
            sendCloseDefaultAction(_local_5, _local_4, _arg_2);
        }

        public function requestSanctionData(_arg_1:int, _arg_2:int):void
        {
            var _local_3:IssueBundle = (_SafeStr_4991.getValue(_arg_1) as IssueBundle);
            if (_local_3 == null)
            {
                return;
            };
            if (_local_3.getHighestPriorityIssue() != null)
            {
                _moderationManager.connection.send(new _SafeStr_734(_local_3.getHighestPriorityIssue().issueId, -1, _arg_2));
            };
        }

        public function requestSanctionDataForAccount(_arg_1:int, _arg_2:int):void
        {
            _moderationManager.connection.send(new _SafeStr_734(-1, _arg_1, _arg_2));
        }

        public function updateSanctionData(_arg_1:int, _arg_2:int, _arg_3:_SafeStr_1636):void
        {
            var _local_4:* = null;
            var _local_5:* = null;
            var _local_6:String = (_arg_3.name + ((_arg_3.avatarOnly) ? " (avatar) " : " "));
            if (_arg_3.sanctionLengthInHours > 24)
            {
                _local_6 = (_local_6 + ((_arg_3.sanctionLengthInHours / 24) + " days"));
            }
            else
            {
                _local_6 = (_local_6 + (_arg_3.sanctionLengthInHours + "h"));
            };
            if (!StringUtil.isEmpty(_arg_3.tradeLockInfo))
            {
                _local_6 = (_local_6 + (" & " + _arg_3.tradeLockInfo));
            };
            if (!StringUtil.isEmpty(_arg_3.machineBanInfo))
            {
                _local_6 = (_local_6 + (" & " + _arg_3.machineBanInfo));
            };
            if (_arg_1 > 0)
            {
                for each (var _local_7:IssueBundle in _SafeStr_4991)
                {
                    if (_local_7.contains(_arg_1))
                    {
                        _local_4 = _issueHandlers.getValue(_local_7.id);
                        if (_local_4 != null)
                        {
                            _local_4.showDefaultSanction(_arg_2, _local_6);
                        };
                    };
                };
            }
            else
            {
                _local_5 = _SafeStr_4997.getValue(_arg_2);
                if (_local_5 != null)
                {
                    _local_5.showDefaultSanction(_arg_2, _local_6);
                };
            };
        }

        private function sendClose(_arg_1:Array, _arg_2:int):void
        {
            if ((((_arg_1 == null) || (_moderationManager == null)) || (_moderationManager.connection == null)))
            {
                return;
            };
            _moderationManager.connection.send(new _SafeStr_476(_arg_1, _arg_2));
        }

        private function sendPick(_arg_1:Array, _arg_2:Boolean, _arg_3:int, _arg_4:String):void
        {
            if ((((_arg_1 == null) || (_moderationManager == null)) || (_moderationManager.connection == null)))
            {
                return;
            };
            _moderationManager.connection.send(new _SafeStr_996(_arg_1, _arg_2, _arg_3, _arg_4));
        }

        private function sendCloseDefaultAction(_arg_1:int, _arg_2:Array, _arg_3:int):void
        {
            _moderationManager.connection.send(new _SafeStr_784(_arg_1, _arg_2, _arg_3));
        }

        public function autoHandle(_arg_1:int):void
        {
            var _local_3:* = null;
            var _local_5:* = null;
            var _local_4:Array = _SafeStr_4991.getValues();
            var _local_2:int = _moderationManager.sessionDataManager.userId;
            for each (_local_5 in _local_4)
            {
                if (((((_local_5.state == 2) && (_local_5.pickerUserId == _local_2)) && (!(_local_5.id == _arg_1))) && ((_local_3 == null) || (_local_5.highestPriority < _local_3.highestPriority))))
                {
                    _local_3 = _local_5;
                };
            };
            if (_local_3 == null)
            {
                autoPick("issue manager pick next");
                return;
            };
            handleBundle(_local_3.id);
        }

        public function issuePickFailed(_arg_1:Array):Boolean
        {
            var _local_6:* = null;
            var _local_4:int;
            var _local_10:* = null;
            var _local_2:int;
            var _local_13:* = null;
            var _local_5:* = null;
            var _local_11:* = null;
            var _local_12:int;
            var _local_8:int;
            var _local_3:* = null;
            if (!_arg_1)
            {
                return (false);
            };
            var _local_7:Boolean;
            var _local_9:int = _moderationManager.sessionDataManager.userId;
            for each (_local_6 in _arg_1)
            {
                _local_4 = _local_6.issueId;
                _local_10 = _local_6.pickerUserName;
                _local_2 = _local_6.pickerUserId;
                if (((!(_local_2 == -1)) && (!(_local_2 == _local_9))))
                {
                    _local_7 = true;
                };
                _local_13 = null;
                for each (_local_5 in _SafeStr_4991)
                {
                    _local_11 = _local_5.getIssueIds();
                    if (_local_11 != null)
                    {
                        for each (_local_12 in _local_11)
                        {
                            if (_local_4 == _local_12)
                            {
                                _local_13 = _local_5;
                                break;
                            };
                        };
                    };
                };
                if (_local_13 != null)
                {
                    _local_8 = _local_13.id;
                    _local_3 = _issueHandlers.getValue(_local_8);
                    if (_local_3 != null)
                    {
                        _local_3.dispose();
                    };
                    releaseBundle(_local_8);
                };
            };
            return (_local_7);
        }

        public function setToolPreferences(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int):void
        {
            _SafeStr_4999 = _arg_1;
            _SafeStr_5000 = _arg_2;
            _SafeStr_5001 = _arg_3;
            _windowWidth = _arg_4;
        }

        public function setCfhTopics(_arg_1:Vector.<_SafeStr_1638>):void
        {
            this._SafeStr_4998 = _arg_1;
        }

        public function getCfhTopics():Vector.<_SafeStr_1638>
        {
            return (_SafeStr_4998);
        }


    }
}//package com.sulake.habbo.moderation

// _SafeStr_1616 = "_-Jg" (String#2516, DoABC#4)
// _SafeStr_1636 = "_-iU" (String#32372, DoABC#4)
// _SafeStr_1638 = "_-Q16" (String#5254, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_334 = "_-32O" (String#30273, DoABC#4)
// _SafeStr_476 = "_-Vf" (String#29334, DoABC#4)
// _SafeStr_4988 = "_-u1t" (String#15121, DoABC#4)
// _SafeStr_4989 = "_-IG" (String#7221, DoABC#4)
// _SafeStr_4990 = "_-b1f" (String#3338, DoABC#4)
// _SafeStr_4991 = "_-37" (String#3184, DoABC#4)
// _SafeStr_4992 = "_-b1u" (String#7476, DoABC#4)
// _SafeStr_4993 = "_-X1C" (String#9369, DoABC#4)
// _SafeStr_4994 = "_-XA" (String#3122, DoABC#4)
// _SafeStr_4995 = "_-6Y" (String#9218, DoABC#4)
// _SafeStr_4996 = "_-d1j" (String#16808, DoABC#4)
// _SafeStr_4997 = "_-l1Z" (String#11946, DoABC#4)
// _SafeStr_4998 = "_-5x" (String#22249, DoABC#4)
// _SafeStr_4999 = "_-L1X" (String#15093, DoABC#4)
// _SafeStr_5000 = "_-a1g" (String#15334, DoABC#4)
// _SafeStr_5001 = "_-A1e" (String#13985, DoABC#4)
// _SafeStr_734 = "_-112" (String#20637, DoABC#4)
// _SafeStr_784 = "_-ZO" (String#29644, DoABC#4)
// _SafeStr_8646 = "_-n16" (String#41364, DoABC#4)
// _SafeStr_8647 = "_-Y1R" (String#35347, DoABC#4)
// _SafeStr_8648 = "_-89" (String#24647, DoABC#4)
// _SafeStr_996 = "_-V16" (String#28920, DoABC#4)


