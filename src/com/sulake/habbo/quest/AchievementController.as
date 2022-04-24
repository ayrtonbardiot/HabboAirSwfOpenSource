// by nota

//com.sulake.habbo.quest.AchievementController

package com.sulake.habbo.quest
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.runtime._SafeStr_41;
    import flash.geom.Point;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window._SafeStr_3133;
    import _-p1o._SafeStr_1618;
    import flash.utils.Timer;
    import flash.utils.Dictionary;
    import com.sulake.habbo.quest.events.UnseenAchievementsCountUpdateEvent;
    import _-Y1h._SafeStr_1026;
    import __AS3__.vec.Vector;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events._SafeStr_3116;
    import _-qv._SafeStr_895;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.widgets._SafeStr_3349;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import flash.events.TimerEvent;
    import com.sulake.habbo.session.events.BadgeImageReadyEvent;

    public class AchievementController implements _SafeStr_13, _SafeStr_41 
    {

        private static const CATEGORIES_COLUMN_COUNT:int = 3;
        private static const CATEGORY_SPACING_X:int = 8;
        private static const CATEGORY_SPACING_Y:int = 5;
        private static const CATEGORY_SPACING_TOP:int = 6;
        private static const CATEGORY_ROWS_MAX:int = 3;
        private static const ACHIEVEMENT_ROWS_MIN:int = 2;
        private static const ACHIEVEMENT_ROWS_MAX:int = 4;
        private static const ACHIEVEMENT_COLUMNS:int = 6;
        private static const IN_LEVEL_PROGRESS_BAR_WIDTH:int = 180;
        private static const TOTAL_PROGRESS_BAR_WIDTH:int = 246;
        private static const _SafeStr_8697:uint = 12910463;
        private static const _SafeStr_8698:int = 45;
        private static const IN_LEVEL_PROGRESS_BAR_LOC:Point = new Point(115, 93);
        private static const TOTAL_PROGRESS_BAR_LOC:Point = new Point(72, 1);
        private static const _SafeStr_8699:int = 20;
        private static const ACHIEVEMENT_TOP_SPACING:int = 3;

        private var _questEngine:HabboQuestEngine;
        private var _window:_SafeStr_3263;
        private var _SafeStr_4765:_SafeStr_3133;
        private var _SafeStr_4767:_SafeStr_3133;
        private var _SafeStr_4769:_SafeStr_3133;
        private var _SafeStr_4768:_SafeStr_3133;
        private var _SafeStr_4766:_SafeStr_3133;
        private var _SafeStr_3921:AchievementCategories;
        private var _SafeStr_4158:AchievementCategory;
        private var _SafeStr_4764:_SafeStr_1618;
        private var _SafeStr_4756:Timer;
        private var _SafeStr_8700:Dictionary = new Dictionary();
        private var _SafeStr_4759:ProgressBar;
        private var _SafeStr_4760:ProgressBar;
        private var _SafeStr_4763:String = null;
        private var _SafeStr_4770:_SafeStr_1618;
        private var _SafeStr_4757:Timer;
        private var _SafeStr_4758:Dictionary = new Dictionary();
        private var _SafeStr_4762:Boolean;
        private var _SafeStr_4761:Dictionary = new Dictionary();

        public function AchievementController(_arg_1:HabboQuestEngine)
        {
            _questEngine = _arg_1;
            _SafeStr_4756 = new Timer(100, 1);
            _SafeStr_4756.addEventListener("timer", doBadgeRefresh);
            _SafeStr_4757 = new Timer(2000, 1);
            _SafeStr_4757.addEventListener("timer", switchIntoPendingLevel);
            _SafeStr_4758[16] = 1;
            _SafeStr_4758[28] = 6;
            _SafeStr_4758[38] = 4;
            _SafeStr_4758[39] = 3;
            _SafeStr_4758[40] = 1;
        }

        public static function moveAllChildrenToColumn(_arg_1:_SafeStr_3133, _arg_2:int, _arg_3:int):void
        {
            var _local_4:int;
            var _local_5:* = null;
            while (_local_4 < _arg_1.numChildren)
            {
                _local_5 = _arg_1.getChildAt(_local_4);
                if ((((!(_local_5 == null)) && (_local_5.visible)) && (_local_5.height > 0)))
                {
                    _local_5.y = _arg_2;
                    _arg_2 = (_arg_2 + (_local_5.height + _arg_3));
                };
                _local_4++;
            };
        }

        public static function getLowestPoint(_arg_1:_SafeStr_3133):int
        {
            var _local_2:int;
            var _local_4:* = null;
            var _local_3:int;
            _local_2 = 0;
            while (_local_2 < _arg_1.numChildren)
            {
                _local_4 = _arg_1.getChildAt(_local_2);
                if (_local_4.visible)
                {
                    _local_3 = Math.max(_local_3, (_local_4.y + _local_4.height));
                };
                _local_2++;
            };
            return (_local_3);
        }


        public function dispose():void
        {
            _questEngine = null;
            _SafeStr_8700 = null;
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
            if (_SafeStr_4756)
            {
                _SafeStr_4756.removeEventListener("timer", doBadgeRefresh);
                _SafeStr_4756.reset();
                _SafeStr_4756 = null;
            };
            if (_SafeStr_4757)
            {
                _SafeStr_4757.removeEventListener("timer", switchIntoPendingLevel);
                _SafeStr_4757.reset();
                _SafeStr_4757 = null;
            };
            if (_SafeStr_4759)
            {
                _SafeStr_4759.dispose();
                _SafeStr_4759 = null;
            };
            if (_SafeStr_4760)
            {
                _SafeStr_4760.dispose();
                _SafeStr_4760 = null;
            };
            _SafeStr_4765 = null;
            _SafeStr_4769 = null;
            _SafeStr_4769 = null;
            _SafeStr_4768 = null;
            _SafeStr_4766 = null;
        }

        public function get disposed():Boolean
        {
            return (_questEngine == null);
        }

        public function isVisible():Boolean
        {
            return ((_window) && (_window.visible));
        }

        public function close():void
        {
            _SafeStr_4761 = new Dictionary();
            broadcastUnseenAchievementsCount();
            if (_window)
            {
                _window.visible = false;
            };
        }

        private function broadcastUnseenAchievementsCount():void
        {
            var _local_2:int;
            for each (var _local_1:_SafeStr_1618 in _SafeStr_4761)
            {
                if (!isSkippedForUnseenBroadcast(_local_1.badgeId))
                {
                    _local_2++;
                };
            };
            _questEngine.events.dispatchEvent(new UnseenAchievementsCountUpdateEvent(_local_2));
        }

        public function onRoomExit():void
        {
            this.close();
        }

        public function onToolbarClick():void
        {
            if (isVisible())
            {
                close();
            }
            else
            {
                show();
            };
        }

        public function ensureAchievementsInitialized():void
        {
            if (_SafeStr_3921 == null)
            {
                _questEngine.send(new _SafeStr_1026());
            };
        }

        public function show():void
        {
            if (_SafeStr_3921 == null)
            {
                _questEngine.send(new _SafeStr_1026());
                _SafeStr_4762 = true;
            }
            else
            {
                refresh();
                this._window.visible = true;
                this._window.activate();
            };
        }

        public function onAchievements(_arg_1:Array, _arg_2:String):void
        {
            if (_SafeStr_3921 == null)
            {
                _SafeStr_3921 = new AchievementCategories(_arg_1);
            };
            if (!_SafeStr_4762)
            {
                return;
            };
            _SafeStr_4762 = false;
            refresh();
            this._window.visible = true;
            this._window.activate();
            var _local_3:String = ((_SafeStr_4763 == null) ? _arg_2 : _SafeStr_4763);
            var _local_4:AchievementCategory = _SafeStr_3921.getCategoryByCode(_local_3);
            if (_local_4 != null)
            {
                pickCategory(_local_4);
                _SafeStr_4763 = null;
            };
        }

        public function onAchievement(_arg_1:_SafeStr_1618):void
        {
            var _local_2:Boolean;
            if (_SafeStr_3921 != null)
            {
                _local_2 = ((_SafeStr_4764) && (_SafeStr_4764.achievementId == _arg_1.achievementId));
                if (((!(_local_2)) && (!(_arg_1.achievementId in _SafeStr_4761))))
                {
                    _SafeStr_4761[_arg_1.achievementId] = _arg_1;
                    broadcastUnseenAchievementsCount();
                };
                if (((_local_2) && (_arg_1.level > _SafeStr_4764.level)))
                {
                    _SafeStr_4764.setMaxProgress();
                    _SafeStr_4770 = _arg_1;
                    _SafeStr_4757.start();
                }
                else
                {
                    _SafeStr_3921.update(_arg_1);
                    if (_local_2)
                    {
                        _SafeStr_4764 = _arg_1;
                    };
                };
                if (((_window) && (_window.visible)))
                {
                    refresh();
                };
            };
        }

        private function getCategoryUnseenCount(_arg_1:String):int
        {
            var _local_3:int;
            for each (var _local_2:_SafeStr_1618 in _SafeStr_4761)
            {
                if (_local_2.category == _arg_1)
                {
                    _local_3++;
                };
            };
            return (_local_3);
        }

        private function refresh():void
        {
            prepareWindow();
            refreshCategoryList();
            refreshCategoryListFooter();
            refreshAchievementsHeader();
            refreshAchievementList();
            refreshAchievementDetails();
            moveAllChildrenToColumn(_window.content, 0, 4);
            _window.height = (getLowestPoint(_window.content) + 45);
        }

        private function refreshCategoryList():void
        {
            var _local_3:int;
            var _local_1:Boolean;
            if (_SafeStr_4158 != null)
            {
                _SafeStr_4765.visible = false;
                return;
            };
            _SafeStr_4765.visible = true;
            var _local_2:Vector.<AchievementCategory> = _SafeStr_3921.categoryList;
            _local_3 = 0;
            while (true)
            {
                if (_local_3 < _local_2.length)
                {
                    refreshCategoryEntry(_local_3, _local_2[_local_3]);
                }
                else
                {
                    _local_1 = refreshCategoryEntry(_local_3, null);
                    if (_local_1) break;
                };
                _local_3++;
            };
            _SafeStr_4765.height = getLowestPoint(_SafeStr_4765);
        }

        private function refreshCategoryListFooter():void
        {
            if (_SafeStr_4158 != null)
            {
                _SafeStr_4766.visible = false;
                return;
            };
            _SafeStr_4766.visible = true;
            _SafeStr_4760.refresh(_SafeStr_3921.getProgress(), _SafeStr_3921.getMaxProgress(), 0, 0);
        }

        private function refreshAchievementList():void
        {
            var _local_5:int;
            var _local_3:Boolean;
            var _local_2:_SafeStr_3109 = _window.findChildByName("achievements_list");
            if (_SafeStr_4158 == null)
            {
                _local_2.visible = false;
                return;
            };
            _local_2.visible = true;
            _SafeStr_14.log((((_SafeStr_4158.code + " has ") + _SafeStr_4158.achievements.length) + " achievemenets"));
            var _local_4:Vector.<_SafeStr_1618> = _SafeStr_4158.achievements;
            while (_SafeStr_4767.numChildren > 0)
            {
                _SafeStr_4767.removeChildAt(0);
            };
            _local_5 = 0;
            while (true)
            {
                if (_local_5 < _local_4.length)
                {
                    refreshAchievementEntry(_local_5, _local_4[_local_5]);
                }
                else
                {
                    _local_3 = refreshAchievementEntry(_local_5, null);
                    if (_local_3) break;
                };
                _local_5++;
            };
            _SafeStr_4767.height = getLowestPoint(_SafeStr_4767);
            _local_2.height = (_SafeStr_4767.height + 1);
            _window.findChildByName("achievements_scrollarea").height = _local_2.height;
            var _local_1:_SafeStr_3109 = _window.findChildByName("achievements_scrollbar");
            _local_1.visible = achievementsNeedScrolling;
            _local_1.height = _local_2.height;
        }

        private function refreshAchievementsHeader():void
        {
            if (_SafeStr_4158 == null)
            {
                _SafeStr_4768.visible = false;
                return;
            };
            _SafeStr_4768.visible = true;
            _SafeStr_4768.findChildByName("category_name_txt").caption = _questEngine.getAchievementCategoryName(_SafeStr_4158.code);
            _questEngine.localization.registerParameter("achievements.details.categoryprogress", "progress", _SafeStr_4158.getProgress().toString());
            _questEngine.localization.registerParameter("achievements.details.categoryprogress", "limit", _SafeStr_4158.getMaxProgress().toString());
            _questEngine.setupAchievementCategoryImage(_SafeStr_4768, _SafeStr_4158, false);
        }

        private function refreshAchievementDetails():void
        {
            if (_SafeStr_4764 == null)
            {
                _SafeStr_4769.visible = false;
                return;
            };
            _SafeStr_4769.visible = true;
            var _local_2:String = getAchievedBadgeId(_SafeStr_4764);
            _SafeStr_4769.findChildByName("achievement_name_txt").caption = _questEngine.localization.getBadgeName(_local_2);
            var _local_1:String = _questEngine.localization.getBadgeDesc(_local_2);
            _SafeStr_4769.findChildByName("achievement_desc_txt").caption = ((_local_1 == null) ? "" : _local_1);
            _questEngine.localization.registerParameter("achievements.details.level", "level", ((_SafeStr_4764.finalLevel) ? _SafeStr_4764.level.toString() : (_SafeStr_4764.level - 1).toString()));
            _questEngine.localization.registerParameter("achievements.details.level", "limit", _SafeStr_4764.levelCount.toString());
            _questEngine.refreshReward((!(_SafeStr_4764.finalLevel)), _SafeStr_4769, _SafeStr_4764.levelRewardPointType, _SafeStr_4764.levelRewardPoints);
            refreshBadgeImageLarge(_SafeStr_4769, _SafeStr_4764);
            _SafeStr_4759.refresh(_SafeStr_4764.currentPoints, _SafeStr_4764.scoreLimit, ((_SafeStr_4764.achievementId * 10000) + _SafeStr_4764.level), _SafeStr_4764.scoreAtStartOfLevel);
            _SafeStr_4759.visible = ((!(_SafeStr_4764.displayMethod == 1)) && (!(_SafeStr_4764.finalLevel)));
        }

        private function prepareWindow():void
        {
            if (this._window != null)
            {
                return;
            };
            _window = _SafeStr_3263(_questEngine.getXmlWindow("Achievements"));
            _window.findChildByTag("close").procedure = onWindowClose;
            _window.findChildByName("back_button").procedure = onBack;
            _window.center();
            _window.y = 20;
            _SafeStr_4765 = _SafeStr_3133(_window.findChildByName("categories_cont"));
            _SafeStr_4768 = _SafeStr_3133(_window.findChildByName("achievements_header_cont"));
            _SafeStr_4767 = _SafeStr_3133(_window.findChildByName("achievements_cont"));
            _SafeStr_4769 = _SafeStr_3133(_window.findChildByName("achievement_cont"));
            _SafeStr_4766 = _SafeStr_3133(_window.findChildByName("categories_footer_cont"));
            _SafeStr_4759 = new ProgressBar(_questEngine, _SafeStr_4769, 180, "achievements.details.progress", true, IN_LEVEL_PROGRESS_BAR_LOC);
            _SafeStr_4760 = new ProgressBar(_questEngine, _SafeStr_4766, 246, "achievements.categories.totalprogress", true, TOTAL_PROGRESS_BAR_LOC);
        }

        private function refreshCategoryEntry(_arg_1:int, _arg_2:AchievementCategory):Boolean
        {
            var _local_5:int;
            var _local_3:_SafeStr_3133 = _SafeStr_3133(_SafeStr_4765.getChildByName(_arg_1.toString()));
            var _local_4:int = int(Math.floor((_arg_1 / 3)));
            var _local_6:* = (_local_4 < 3);
            if (_local_3 == null)
            {
                if (((_arg_2 == null) && (!(_local_6))))
                {
                    return (true);
                };
                _local_3 = _SafeStr_3133(_questEngine.getXmlWindow("AchievementCategory"));
                _local_3.name = _arg_1.toString();
                _SafeStr_4765.addChild(_local_3);
                _local_3.findChildByName("category_region").procedure = onSelectCategory;
                _local_3.x = ((_local_3.width + 8) * (_arg_1 % 3));
                _local_3.y = (((_local_3.height + 5) * Math.floor((_arg_1 / 3))) + 6);
            };
            _local_3.findChildByName("category_region").id = _arg_1;
            _local_3.findChildByName("category_region").visible = (!(_arg_2 == null));
            _local_3.findChildByName("category_bg_inact").visible = (_arg_2 == null);
            _local_3.findChildByName("category_bg_act").visible = (!(_arg_2 == null));
            _local_3.findChildByName("category_bg_act_hover").visible = false;
            _local_3.findChildByName("header_txt").visible = (!(_arg_2 == null));
            _local_3.findChildByName("completion_txt").visible = (!(_arg_2 == null));
            _local_3.findChildByName("category_pic_bitmap").visible = (!(_arg_2 == null));
            _local_3.findChildByName("unseen_count_border").visible = false;
            if (_arg_2)
            {
                _local_3.findChildByName("header_txt").caption = _questEngine.getAchievementCategoryName(_arg_2.code);
                _local_3.findChildByName("completion_txt").caption = ((_arg_2.getProgress() + "/") + _arg_2.getMaxProgress());
                _questEngine.setupAchievementCategoryImage(_local_3, _arg_2, true);
                _local_5 = getCategoryUnseenCount(_arg_2.code);
                if (_local_5 > 0)
                {
                    _local_3.findChildByName("unseen_count_border").visible = true;
                    _local_3.findChildByName("unseen_count").caption = _local_5.toString();
                };
                _local_3.visible = true;
            }
            else
            {
                _local_3.visible = _local_6;
            };
            return (false);
        }

        private function refreshAchievementEntry(_arg_1:int, _arg_2:_SafeStr_1618):Boolean
        {
            var _local_5:int = int((_arg_1 / achievementsColumnCount));
            var _local_8:* = (_local_5 < 2);
            if (((_arg_2 == null) && (!(_local_8))))
            {
                return (true);
            };
            var _local_3:_SafeStr_3133 = (_questEngine.getXmlWindow("Achievement") as _SafeStr_3133);
            _SafeStr_4767.addChild(_local_3);
            _local_3.x = ((_local_3.width + ((achievementsNeedScrolling) ? 5 : 0)) * (_arg_1 % achievementsColumnCount));
            _SafeStr_14.log(((((((("Refreshing " + _arg_1) + " where count is ") + _SafeStr_4158.achievements.length) + ", row=") + _local_5) + ", column=") + (_arg_1 % achievementsColumnCount)));
            _local_3.y = ((_local_3.height * _local_5) + 3);
            _local_3.findChildByName("bg_region").procedure = onSelectAchievement;
            var _local_6:_SafeStr_3109 = _local_3.findChildByName("bg_region");
            _local_6.id = _arg_1;
            _local_6.visible = (!(_arg_2 == null));
            var _local_4:_SafeStr_3109 = _local_3.findChildByName("bg_unselected_bitmap");
            var _local_7:_SafeStr_3109 = _local_3.findChildByName("bg_selected_bitmap");
            this.refreshBadgeImage(_local_3, _arg_2);
            _local_4.color = (((!(_arg_2 == null)) && (_arg_2.achievementId in _SafeStr_4761)) ? 12910463 : 0xFFFFFF);
            if (_arg_2)
            {
                _local_4.visible = (!(_arg_2 == _SafeStr_4764));
                _local_7.visible = (_arg_2 == _SafeStr_4764);
                _local_3.visible = true;
            }
            else
            {
                if (_local_8)
                {
                    _local_7.visible = false;
                    _local_4.visible = true;
                    _local_3.visible = true;
                }
                else
                {
                    _local_3.visible = false;
                };
            };
            return (false);
        }

        private function onWindowClose(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                close();
            };
        }

        private function onSelectCategory(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:int = _arg_2.id;
            _SafeStr_14.log(("Category index: " + _local_3));
            if (_arg_1.type == "WME_CLICK")
            {
                pickCategory(_SafeStr_3921.categoryList[_local_3]);
            }
            else
            {
                if (_arg_1.type == "WME_OUT")
                {
                    refreshMouseOver(-999);
                }
                else
                {
                    if (_arg_1.type == "WME_OVER")
                    {
                        refreshMouseOver(_local_3);
                    };
                };
            };
        }

        private function pickCategory(_arg_1:AchievementCategory):void
        {
            _SafeStr_4158 = _arg_1;
            _SafeStr_4764 = _SafeStr_4158.achievements[0];
            _SafeStr_14.log(("Category: " + _SafeStr_4158.code));
            this.refresh();
            _questEngine.send(new _SafeStr_895("Achievements", _SafeStr_4158.code, "Category selected"));
        }

        public function selectCategoryInternalLink(_arg_1:String):void
        {
            var _local_2:AchievementCategory = ((_SafeStr_3921 != null) ? _SafeStr_3921.getCategoryByCode(_arg_1) : null);
            if (_local_2 != null)
            {
                pickCategory(_local_2);
            }
            else
            {
                _SafeStr_4763 = _arg_1;
            };
        }

        private function refreshMouseOver(_arg_1:int):void
        {
            var _local_4:int;
            var _local_2:Boolean;
            var _local_3:* = null;
            var _local_5:* = null;
            _local_4 = 0;
            while (_local_4 < _SafeStr_4765.numChildren)
            {
                _local_2 = (_local_4 == _arg_1);
                _local_3 = _SafeStr_3133(_SafeStr_4765.getChildAt(_local_4));
                _local_3.findChildByName("category_bg_act").visible = ((!(_local_2)) && (_local_4 < _SafeStr_3921.categoryList.length));
                _local_3.findChildByName("category_bg_act_hover").visible = _local_2;
                _local_5 = _local_3.findChildByName("hover_container");
                _local_5.x = ((_local_2) ? 0 : 1);
                _local_5.y = ((_local_2) ? 0 : 1);
                _local_4++;
            };
        }

        private function onSelectAchievement(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            var _local_3:int = _arg_2.id;
            _SafeStr_4764 = _SafeStr_4158.achievements[_local_3];
            this.refresh();
            _questEngine.send(new _SafeStr_895("Achievements", _SafeStr_4764.achievementId.toString(), "Achievement selected"));
        }

        private function onBack(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_4:* = null;
            var _local_3:* = null;
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            if (_SafeStr_4158 != null)
            {
                _local_4 = [];
                for each (_local_3 in _SafeStr_4761)
                {
                    if (_local_3.category != _SafeStr_4158.code)
                    {
                        _local_4.push(_local_3);
                    };
                };
                _SafeStr_4761 = new Dictionary();
                for each (_local_3 in _local_4)
                {
                    _SafeStr_4761[_local_3.achievementId] = _local_3;
                };
                broadcastUnseenAchievementsCount();
            };
            _SafeStr_4158 = null;
            _SafeStr_4764 = null;
            this.refresh();
        }

        private function refreshBadgeImage(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1618):void
        {
            var _local_4:_SafeStr_3199 = (_arg_1.findChildByName("achievement_pic_bitmap") as _SafeStr_3199);
            var _local_3:_SafeStr_3349 = (_local_4.widget as _SafeStr_3349);
            if (_arg_2 == null)
            {
                _local_4.visible = false;
                return;
            };
            IStaticBitmapWrapperWindow(_SafeStr_3133(_local_4.rootWindow).findChildByName("bitmap")).assetUri = "common_loading_icon";
            _local_3.badgeId = getAchievedBadgeId(_arg_2);
            _local_3.greyscale = (!(_arg_2.firstLevelAchieved));
            _local_4.visible = true;
        }

        private function refreshBadgeImageLarge(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1618):void
        {
            var _local_4:_SafeStr_3199 = (_arg_1.findChildByName("achievement_pic_bitmap") as _SafeStr_3199);
            var _local_3:_SafeStr_3349 = (_local_4.widget as _SafeStr_3349);
            IStaticBitmapWrapperWindow(_SafeStr_3133(_local_4.rootWindow).findChildByName("bitmap")).assetUri = "common_loading_icon";
            _local_3.badgeId = getAchievedBadgeId(_arg_2);
            _local_3.greyscale = (!(_arg_2.firstLevelAchieved));
            _local_4.visible = true;
        }

        private function doBadgeRefresh(_arg_1:TimerEvent):void
        {
            this._SafeStr_4756.reset();
            this.refresh();
        }

        private function switchIntoPendingLevel(_arg_1:TimerEvent):void
        {
            _SafeStr_4764 = _SafeStr_4770;
            _SafeStr_3921.update(_SafeStr_4770);
            _SafeStr_4770 = null;
            this.refresh();
        }

        public function onBadgeImageReady(_arg_1:BadgeImageReadyEvent):void
        {
            if (_window == null)
            {
                return;
            };
            this._SafeStr_8700[_arg_1.badgeId] = _arg_1.badgeImage;
            if (!this._SafeStr_4756.running)
            {
                this._SafeStr_4756.start();
            };
        }

        public function update(_arg_1:uint):void
        {
            if (_SafeStr_4759 != null)
            {
                _SafeStr_4759.updateView();
            };
            if (_SafeStr_4760 != null)
            {
                _SafeStr_4760.updateView();
            };
        }

        private function getAchievedBadgeId(_arg_1:_SafeStr_1618):String
        {
            if (_arg_1.levelCount == 1)
            {
                return (_arg_1.badgeId);
            };
            return ((_arg_1.finalLevel) ? _arg_1.badgeId : _questEngine.localization.getPreviousLevelBadgeId(_arg_1.badgeId));
        }

        private function getPositionFix(_arg_1:int):int
        {
            return ((_SafeStr_4758[_arg_1]) ? _SafeStr_4758[_arg_1] : 0);
        }

        private function get achievementsColumnCount():int
        {
            if (achievementsNeedScrolling)
            {
                return (6 - 1);
            };
            return (6);
        }

        private function get achievementsNeedScrolling():Boolean
        {
            return ((!(_SafeStr_4158 == null)) && (_SafeStr_4158.achievements.length > (4 * 6)));
        }

        private function isSkippedForUnseenBroadcast(_arg_1:String):Boolean
        {
            var _local_3:Boolean;
            var _local_4:Array = _questEngine.getProperty("toolbar.unseen_notification.skipped_badge_ids").split(",");
            for each (var _local_2:String in _local_4)
            {
                if (_arg_1.search(_local_2) != -1)
                {
                    _local_3 = true;
                    break;
                };
            };
            return (_local_3);
        }

        public function getAchievementLevel(_arg_1:String, _arg_2:String):int
        {
            var _local_4:* = null;
            if (_SafeStr_3921 != null)
            {
                _local_4 = _SafeStr_3921.getCategoryByCode(_arg_1);
                if (_local_4 != null)
                {
                    for each (var _local_3:_SafeStr_1618 in _local_4.achievements)
                    {
                        if (_local_3.badgeId.indexOf(_arg_2) == 0)
                        {
                            return ((_local_3.finalLevel) ? _local_3.level : Math.max(0, (_local_3.level - 1)));
                        };
                    };
                };
            };
            return (0);
        }


    }
}//package com.sulake.habbo.quest

// _SafeStr_1026 = "_-wM" (String#18433, DoABC#4)
// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1618 = "_-N2" (String#3339, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3349 = "_-c1x" (String#1353, DoABC#4)
// _SafeStr_3921 = "_-UY" (String#870, DoABC#4)
// _SafeStr_41 = "_-m5" (String#2087, DoABC#4)
// _SafeStr_4158 = "_-pH" (String#830, DoABC#4)
// _SafeStr_4756 = "_-31j" (String#6084, DoABC#4)
// _SafeStr_4757 = "_-Gl" (String#7123, DoABC#4)
// _SafeStr_4758 = "_-U10" (String#7481, DoABC#4)
// _SafeStr_4759 = "_-31L" (String#6699, DoABC#4)
// _SafeStr_4760 = "_-3x" (String#7292, DoABC#4)
// _SafeStr_4761 = "_-B1O" (String#5210, DoABC#4)
// _SafeStr_4762 = "_-61i" (String#11569, DoABC#4)
// _SafeStr_4763 = "_-V1D" (String#10376, DoABC#4)
// _SafeStr_4764 = "_-L1Z" (String#2478, DoABC#4)
// _SafeStr_4765 = "_-MF" (String#5753, DoABC#4)
// _SafeStr_4766 = "_-Rl" (String#10169, DoABC#4)
// _SafeStr_4767 = "_-i1V" (String#8386, DoABC#4)
// _SafeStr_4768 = "_-C19" (String#8618, DoABC#4)
// _SafeStr_4769 = "_-zR" (String#5324, DoABC#4)
// _SafeStr_4770 = "_-Yl" (String#11387, DoABC#4)
// _SafeStr_8697 = "_-zq" (String#34621, DoABC#4)
// _SafeStr_8698 = "_-12X" (String#31004, DoABC#4)
// _SafeStr_8699 = "_-Xm" (String#32054, DoABC#4)
// _SafeStr_8700 = "_-sZ" (String#12123, DoABC#4)
// _SafeStr_895 = "_-6o" (String#1376, DoABC#4)


