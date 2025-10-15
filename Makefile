# ==============================
# 📦 Flutter Coverage Manual Badge
# ==============================

# Manual coverage badge generation
coverage_manual:
ifeq ($(strip $(PERCENT)),)
	$(error Please provide a PERCENT value, e.g., make coverage_manual PERCENT=92)
endif
	@echo "🏷️ Generating manual coverage badge for $(PERCENT)%..."
	@dart scripts/generate_coverage_badge_manual.dart $(PERCENT)
	@echo "✅ Manual coverage badge generated with $(PERCENT)%."
