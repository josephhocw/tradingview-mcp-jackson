# Linear Regression Channel Strategy Documentation

## 1. Overview

This strategy uses a Linear Regression Channel (LRC) to identify breakout opportunities and manage trades automatically.

Key features:

- Dynamic channel selection
- Channel quality scoring based on:
  - Channel utilization
  - Channel width
  - Support/Resistance (S/R) touches
- ATR-based zone calculations
- Trend filtering using normalized angle

## 2. Key Definitions

- **Upper Line**: Top boundary of the regression channel
- **Lower Line**: Bottom boundary of the regression channel
- **ATR**: Average True Range (volatility measure)
- **Normalized Angle**: Trend strength indicator
- **DTB (Downtrend Breakout)**: Long setup
- **UTB (Uptrend Breakdown)**: Short setup
- **Support/Resistance Extensions**
  - **ER1 / ER2**: Extended Resistance levels
  - **ES1 / ES2**: Extended Support levels

## 3. Long Entry Logic (DTB – Downtrend Breakout)

### Conditions:

**Price Interaction with DTB Zone**
- Default: High ≥ (Upper Line − 2.5 × ATR)
- If ER1/ER2 exists: DTB Zone = ER1 + 1 × ATR
- High must reach this zone

**Trend Filter**
- Normalized Angle < 20 → Downtrend required

**Breakout Confirmation**
- Closing price > DTB Zone

## 4. Short Entry Logic (UTB – Uptrend Breakdown)

### Conditions:

**Price Interaction with UTB Zone**
- Default: Low ≤ (Lower Line + 2.5 × ATR)
- If ES1/ES2 exists: UTB Zone = ES1 − 1 × ATR
- Low must reach this zone

**Trend Filter**
- Normalized Angle > 20 → Uptrend required

**Breakdown Confirmation**
- Closing price < UTB Zone

## 5. Short Trade Management

### Take Profit (ONLY if trade is in profit)

1. **Identify Trigger Bar**: First bar that closes above the 9-period Moving Average
2. **Confirmation**: Next bar closes above the high of the trigger bar
3. **Action**: Exit (Take Profit)

### Stop Loss (Short Position)

Exit if either condition is met:
- Price closes within 1 ATR above:
  - Upper Line (at time of entry), OR
  - Extended Resistance (if present)

## 6. Long Trade Management

### Take Profit
- Mirror of short logic
- Trigger bar = first close below 9 MA
- Next bar closes below trigger bar low → exit

### Stop Loss
- Mirror of short logic
- Based on: Lower Line OR Extended Support
- Threshold = 1 ATR

## 7. Notes for Implementation

- All levels (channel lines, ER/ES) must be referenced at time of entry
