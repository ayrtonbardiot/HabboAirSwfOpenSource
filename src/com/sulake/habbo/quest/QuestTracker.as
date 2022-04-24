// by nota

//com.sulake.habbo.quest.QuestTracker

package com.sulake.habbo.quest
{
    import com.sulake.core.runtime._SafeStr_13;
    import flash.geom.Point;
    import _-41O._SafeStr_1607;
    import com.sulake.core.window._SafeStr_3133;
    import flash.utils.Timer;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events._SafeStr_3116;
    import _-61d._SafeStr_438;
    import _-61d._SafeStr_705;
    import flash.events.TimerEvent;
    import com.sulake.core.window.components._SafeStr_3263;

    public class QuestTracker implements _SafeStr_13 
    {

        private static const TRACKER_ANIMATION_STATUS_NONE:int = 0;
        private static const TRACKER_ANIMATION_STATUS_SLIDE_IN:int = 1;
        private static const TRACKER_ANIMATION_STATUS_SLIDE_OUT:int = 2;
        private static const TRACKER_ANIMATION_STATUS_COMPLETED_ANIMATION:int = 3;
        private static const TRACKER_ANIMATION_STATUS_PROGRESS_NUDGE:int = 4;
        private static const TRACKER_ANIMATION_STATUS_CLOSE_WAIT:int = 5;
        private static const TRACKER_ANIMATION_STATUS_PROMPT_ANIMATION:int = 6;
        private static const NUDGE_OFFSETS:Array = [-2, -3, -2, 0, 2, 3, 2, 0, 2, 1, 0, 1];
        private static const _SafeStr_6393:Array = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 4];
        private static const MAX_SUCCESS_FRAME:int = 6;
        private static const PROMPT_SEQUENCE_REPEATS:int = 4;
        private static const PROMPT_SEQUENCE_REPEATS_QUEST_OPEN:int = 2;
        private static const PROMPT_FRAME_LENGTH_IN_MSECS:int = 200;
        private static const PROMPT_FRAMES:Array = ["a", "b", "c", "d"];
        private static const PROMPT_DELAY_IN_MSECS:int = 10000;
        private static const PROMPT_DELAY_ON_QUEST_OPEN_IN_MSECS:int = 0;
        private static const _SafeStr_8707:int = -1;
        private static const PROGRESS_BAR_LOC:Point = new Point(10, 87);
        private static const PROGRESS_BAR_WIDTH:int = 162;
        private static const TRACKER_SLIDE_IN_SPEED:Number = 0.01;
        private static const TRACKER_SLIDE_OUT_SPEED:Number = 100;
        private static const COMPLETION_CLOSE_DELAY_IN_MSECS:int = 1000;
        private static const TOOLBAR_EXTENSION_ID:String = "quest_tracker";
        private static const _SafeStr_8708:int = 10;

        private var _questEngine:HabboQuestEngine;
        private var _SafeStr_6392:_SafeStr_1607;
        private var _window:_SafeStr_3133;
        private var _SafeStr_6391:Timer;
        private var _SafeStr_6094:ProgressBar;
        private var _trackerAnimationStatus:int = 0;
        private var _SafeStr_6395:int = 0;
        private var _SafeStr_6396:int = 0;
        private var _successFrame:int = -1;
        private var _msecsUntilPrompt:int = -1;
        private var _promptFrame:int = -1;
        private var _msecsUntilNextPromptFrame:int;
        private var _SafeStr_6394:int;
        private var _SafeStr_6399:Boolean;
        private var _SafeStr_6397:Boolean;
        private var _SafeStr_6398:Boolean = false;

        public function QuestTracker(_arg_1:HabboQuestEngine)
        {
            _questEngine = _arg_1;
        }

        public function dispose():void
        {
            if (_questEngine)
            {
                _questEngine.toolbar.extensionView.detachExtension("quest_tracker");
            };
            _questEngine = null;
            _SafeStr_6392 = null;
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
            if (_SafeStr_6391)
            {
                _SafeStr_6391.stop();
                _SafeStr_6391 = null;
            };
            if (_SafeStr_6094)
            {
                _SafeStr_6094.dispose();
                _SafeStr_6094 = null;
            };
        }

        public function get disposed():Boolean
        {
            return (_questEngine == null);
        }

        public function onQuestCompleted(_arg_1:_SafeStr_1607, _arg_2:Boolean):void
        {
            if (_window)
            {
                clearPrompt();
                _SafeStr_6392 = _arg_1;
                _SafeStr_6395 = 0;
                refreshTrackerDetails();
                _successFrame = 0;
                _trackerAnimationStatus = 3;
                _SafeStr_6397 = (!(_arg_2));
            };
        }

        public function onQuestCancelled():void
        {
            _SafeStr_6392 = null;
            if (_window)
            {
                clearPrompt();
                _SafeStr_6094.refresh(0, 100, -1, 0);
                _trackerAnimationStatus = 2;
            };
        }

        public function onRoomEnter():void
        {
            var _local_2:int;
            var _local_3:* = (_questEngine.getInteger("new.identity", 0) > 0);
            if (!_local_3)
            {
                return;
            };
            var _local_1:String = getDefaultCampaign();
            if ((((_SafeStr_6391 == null) && (_local_3)) && (!(_local_1 == ""))))
            {
                _local_2 = _questEngine.getInteger("questing.startQuestDelayInSeconds", 30);
                _SafeStr_6391 = new Timer((_local_2 * 1000), 1);
                _SafeStr_6391.addEventListener("timer", onStartQuestTimer);
                _SafeStr_6391.start();
                _SafeStr_14.log(("Initialized start quest timer with period: " + _local_2));
            };
        }

        public function onRoomExit():void
        {
            if (((!(_window == null)) && (_window.visible)))
            {
                _window.findChildByName("more_info_txt").visible = false;
                _window.findChildByName("more_info_region").visible = false;
            };
        }

        public function onQuest(_arg_1:_SafeStr_1607):void
        {
            if (_SafeStr_6391 != null)
            {
                _SafeStr_6391.stop();
            };
            var _local_2:Boolean = ((_window) && (_window.visible));
            if (_arg_1.waitPeriodSeconds > 0)
            {
                if (_local_2)
                {
                    setWindowVisible(false);
                };
                return;
            };
            _SafeStr_6392 = _arg_1;
            prepareTrackerWindow();
            refreshTrackerDetails();
            refreshPromptFrames();
            setWindowVisible(true);
            hideSuccessFrames();
            if (_local_2)
            {
                if (this._trackerAnimationStatus == 2)
                {
                    this._trackerAnimationStatus = 1;
                };
                setupPrompt(_msecsUntilPrompt, 4, false);
            }
            else
            {
                this._window.x = getOutScreenLocationX();
                this._trackerAnimationStatus = 1;
                setupPrompt(0, 2, false);
            };
        }

        private function refreshPromptFrames():void
        {
            var _local_1:int;
            if (!_questEngine.isQuestWithPrompts(_SafeStr_6392))
            {
                return;
            };
            _local_1 = 0;
            while (_local_1 < PROMPT_FRAMES.length)
            {
                _questEngine.setupPromptFrameImage(_window, _SafeStr_6392, PROMPT_FRAMES[_local_1]);
                _local_1++;
            };
        }

        private function prepareTrackerWindow():void
        {
            if (this._window != null)
            {
                return;
            };
            _window = _SafeStr_3133(_questEngine.getXmlWindow("QuestTracker"));
            _window.findChildByName("more_info_region").procedure = onMoreInfo;
            hideSuccessFrames();
            _SafeStr_6094 = new ProgressBar(_questEngine, _SafeStr_3133(_window.findChildByName("content_cont")), 162, "quests.tracker.progress", false, PROGRESS_BAR_LOC);
        }

        private function hideSuccessFrames():void
        {
            var _local_1:int;
            _local_1 = 1;
            while (_local_1 <= 6)
            {
                getSuccessFrame(_local_1).visible = false;
                _local_1++;
            };
        }

        private function hidePromptFrames():void
        {
            var _local_1:int;
            _local_1 = 0;
            while (_local_1 < PROMPT_FRAMES.length)
            {
                getPromptFrame(PROMPT_FRAMES[_local_1]).visible = false;
                _local_1++;
            };
        }

        private function getSuccessFrame(_arg_1:int):_SafeStr_3109
        {
            return (_window.findChildByName(("success_pic_" + _arg_1)));
        }

        private function getPromptFrame(_arg_1:String):_SafeStr_3109
        {
            return (_window.findChildByName(("prompt_pic_" + _arg_1)));
        }

        private function refreshTrackerDetails():void
        {
            _questEngine.localization.registerParameter("quests.tracker.caption", "quest_name", _questEngine.getQuestName(_SafeStr_6392));
            _window.findChildByName("desc_txt").caption = _questEngine.getQuestDesc(_SafeStr_6392);
            _window.findChildByName("more_info_txt").visible = _questEngine.currentlyInRoom;
            _window.findChildByName("more_info_region").visible = _questEngine.currentlyInRoom;
            var _local_1:int = int(Math.ceil(((100 * _SafeStr_6392.completedSteps) / _SafeStr_6392.totalSteps)));
            _SafeStr_6094.refresh(_local_1, 100, _SafeStr_6392.id, 0);
            _questEngine.setupQuestImage(_window, _SafeStr_6392);
        }

        private function onMoreInfo(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                _questEngine.questController.questDetails.showDetails(_SafeStr_6392);
            };
        }

        public function forceWindowCloseAfterAnimationsFinished():void
        {
            if (_trackerAnimationStatus == 0)
            {
                setWindowVisible(false);
                _SafeStr_6398 = false;
            }
            else
            {
                _SafeStr_6398 = true;
            };
        }

        public function update(_arg_1:uint):void
        {
            var _local_4:int;
            var _local_2:int;
            var _local_3:int;
            if (_window == null)
            {
                return;
            };
            _SafeStr_6094.updateView();
            switch (_trackerAnimationStatus)
            {
                case 1:
                    _local_4 = getDefaultLocationX();
                    _local_2 = (_window.x - _local_4);
                    if (_local_2 > 0)
                    {
                        _local_3 = Math.max(1, Math.round(((_local_2 * _arg_1) * 0.01)));
                        _window.x = (_window.x - _local_3);
                    }
                    else
                    {
                        _trackerAnimationStatus = 0;
                        _window.x = _local_4;
                    };
                    return;
                case 2:
                    _local_4 = getOutScreenLocationX();
                    _local_2 = (_window.width - _window.x);
                    if (_local_2 > 0)
                    {
                        _local_3 = int(Math.max(1, Math.round(((_arg_1 * 100) / _local_2))));
                        _window.x = (_window.x + _local_3);
                    }
                    else
                    {
                        _trackerAnimationStatus = 0;
                        _window.x = _local_4;
                        setWindowVisible(false);
                    };
                    return;
                case 3:
                    hideSuccessFrames();
                    getSuccessFrame(_SafeStr_6393[_successFrame]).visible = true;
                    _successFrame++;
                    if (_successFrame >= _SafeStr_6393.length)
                    {
                        _trackerAnimationStatus = 5;
                        _SafeStr_6396 = 1000;
                    };
                    return;
                case 6:
                    setQuestImageVisible(false);
                    hidePromptFrames();
                    _msecsUntilNextPromptFrame = (_msecsUntilNextPromptFrame - _arg_1);
                    getPromptFrame(PROMPT_FRAMES[_promptFrame]).visible = true;
                    if (_msecsUntilNextPromptFrame < 0)
                    {
                        _msecsUntilNextPromptFrame = 200;
                        _promptFrame++;
                        if (_promptFrame >= PROMPT_FRAMES.length)
                        {
                            _promptFrame = 0;
                            _SafeStr_6394--;
                            if (_SafeStr_6394 < 1)
                            {
                                setupPrompt(10000, 2, true);
                                _trackerAnimationStatus = 0;
                            };
                        };
                    };
                    return;
                case 4:
                    if (_SafeStr_6395 >= (NUDGE_OFFSETS.length - 1))
                    {
                        _window.x = getDefaultLocationX();
                        _trackerAnimationStatus = 0;
                        setupPrompt(10000, 2, false);
                    }
                    else
                    {
                        _window.x = (getDefaultLocationX() + NUDGE_OFFSETS[_SafeStr_6395]);
                        _SafeStr_6395++;
                    };
                    return;
                case 5:
                    _SafeStr_6396 = (_SafeStr_6396 - _arg_1);
                    if (_SafeStr_6396 < 0)
                    {
                        _trackerAnimationStatus = 0;
                        if (((_SafeStr_6397) && (!(_SafeStr_6398))))
                        {
                            _questEngine.send(new _SafeStr_438());
                        }
                        else
                        {
                            setWindowVisible(false);
                            _SafeStr_6398 = false;
                        };
                    };
                    return;
                case 0:
                    if (_msecsUntilPrompt != -1)
                    {
                        _msecsUntilPrompt = (_msecsUntilPrompt - _arg_1);
                        if (_msecsUntilPrompt < 0)
                        {
                            _msecsUntilPrompt = -1;
                            if (((!(_SafeStr_6392 == null)) && (_questEngine.isQuestWithPrompts(_SafeStr_6392))))
                            {
                                if (_SafeStr_6399)
                                {
                                    startNudge();
                                }
                                else
                                {
                                    _trackerAnimationStatus = 6;
                                    _promptFrame = 0;
                                    _msecsUntilNextPromptFrame = 200;
                                };
                            };
                        };
                    };
                default:
            };
        }

        private function getDefaultLocationX():int
        {
            return (0);
        }

        private function getOutScreenLocationX():int
        {
            return (_window.width + 10);
        }

        public function isVisible():Boolean
        {
            return ((_window) && (_window.visible));
        }

        private function onStartQuestTimer(_arg_1:TimerEvent):void
        {
            if (this.hasBlockingWindow())
            {
                _SafeStr_14.log("Quest start blocked. Waiting some more");
                _SafeStr_6391.reset();
                _SafeStr_6391.start();
            }
            else
            {
                _questEngine.questController.questDetails.openForNextQuest = _questEngine.getBoolean("questing.showDetailsForNextQuest");
                _questEngine.send(new _SafeStr_705(getDefaultCampaign()));
            };
        }

        private function getDefaultCampaign():String
        {
            var _local_1:String = _questEngine.getProperty("questing.defaultCampaign");
            return ((_local_1 == null) ? "" : _local_1);
        }

        private function hasBlockingWindow():Boolean
        {
            var _local_2:int;
            var _local_1:* = null;
            _local_2 = 0;
            while (_local_2 <= 2)
            {
                _local_1 = _questEngine.windowManager.getDesktop(_local_2);
                if (((!(_local_1 == null)) && (hasBlockingWindowInLayer(_local_1))))
                {
                    return (true);
                };
                _local_2++;
            };
            return (false);
        }

        private function hasBlockingWindowInLayer(_arg_1:_SafeStr_3133):Boolean
        {
            var _local_3:int;
            var _local_2:* = null;
            while (_local_3 < _arg_1.numChildren)
            {
                _local_2 = _arg_1.getChildAt(_local_3);
                if (((!(_local_2 == null)) && (_local_2.visible)))
                {
                    if ((_local_2 as _SafeStr_3263) != null)
                    {
                        if (((!(_local_2.name == "mod_start_panel")) && (!(_local_2.name == "_frame"))))
                        {
                            return (true);
                        };
                    }
                    else
                    {
                        if (_local_2.name == "welcome_screen")
                        {
                            return (true);
                        };
                    };
                };
                _local_3++;
            };
            return (false);
        }

        private function setQuestImageVisible(_arg_1:Boolean):void
        {
            _window.findChildByName("quest_pic_bitmap").visible = _arg_1;
        }

        private function clearPrompt():void
        {
            setupPrompt(-1, 0, false);
        }

        private function setupPrompt(_arg_1:int, _arg_2:int, _arg_3:Boolean):void
        {
            setQuestImageVisible(true);
            hidePromptFrames();
            _msecsUntilPrompt = _arg_1;
            _SafeStr_6394 = _arg_2;
            _SafeStr_6399 = _arg_3;
        }

        private function startNudge():void
        {
            _SafeStr_6395 = 0;
            _trackerAnimationStatus = 4;
        }

        private function setWindowVisible(_arg_1:Boolean):void
        {
            _window.visible = _arg_1;
            if (!_arg_1)
            {
                _questEngine.toolbar.extensionView.detachExtension("quest_tracker");
            }
            else
            {
                _questEngine.toolbar.extensionView.attachExtension("quest_tracker", _window);
            };
        }


    }
}//package com.sulake.habbo.quest

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1607 = "_-oH" (String#1847, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3216 = "_-o1L" (String#2319, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_438 = "_-es" (String#19064, DoABC#4)
// _SafeStr_6094 = "_-718" (String#3828, DoABC#4)
// _SafeStr_6391 = "_-w1W" (String#5443, DoABC#4)
// _SafeStr_6392 = "_-zX" (String#3901, DoABC#4)
// _SafeStr_6393 = "_-q1p" (String#14871, DoABC#4)
// _SafeStr_6394 = "_-i1C" (String#10379, DoABC#4)
// _SafeStr_6395 = "_-G1t" (String#7311, DoABC#4)
// _SafeStr_6396 = "_-n1i" (String#10412, DoABC#4)
// _SafeStr_6397 = "_-6f" (String#22261, DoABC#4)
// _SafeStr_6398 = "_-Y1U" (String#8973, DoABC#4)
// _SafeStr_6399 = "_-cK" (String#19054, DoABC#4)
// _SafeStr_705 = "_-eG" (String#18991, DoABC#4)
// _SafeStr_8707 = "_-V1r" (String#36378, DoABC#4)
// _SafeStr_8708 = "_-ug" (String#34319, DoABC#4)


