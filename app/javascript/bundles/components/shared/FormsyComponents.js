import { withFormsy } from "formsy-react";
import PropTypes from "prop-types";
import React from "react";

class FormsyInput extends React.Component {
  static propTypes = {
    getErrorMessage: PropTypes.func,
    isPristine: PropTypes.func,
    isValid: PropTypes.func,
    showRequired: PropTypes.func,
    setValue: PropTypes.func,
    getValue: PropTypes.func,
    label: PropTypes.string,
    type: PropTypes.string,
    className: PropTypes.string
  };

  constructor(props) {
    super(props);
  }

  changeValue = event => {
    if (event.currentTarget.type === "checkbox") {
      this.props.setValue(event.currentTarget.checked || "");
    } else {
      this.props.setValue(event.currentTarget.value);
    }
  };

  render() {
    const {
      getErrorMessage,
      isPristine,
      isValid,
      showRequired,
      showError,
      getValue,
      label,
      type,
      className
    } = this.props;

    const showErrorMessage = getErrorMessage(),
      isPristineInput = isPristine(),
      isValidInput = isValid(),
      displayRequired = showRequired(),
      displayError = typeof showError === "boolean" ? showError : showError(),
      showRequiredMessage =
        !isPristineInput && !isValidInput && displayRequired;
    return (
      <div className={className}>
        {(type === "text" || type === "textarea") && (
          <div>
            {label && <label>{label}</label>}
            {type === "text" && (
              <input
                className="form-control"
                onChange={this.changeValue}
                type={type}
                value={getValue() || ""}
              />
            )}
            {type === "textarea" && (
              <textarea
                rows="5"
                className="form-control"
                onChange={this.changeValue}
                type={type}
                value={getValue() || ""}
              />
            )}
            {showRequiredMessage && (
              <span className="error-message">
                {label || "This field"} is required
              </span>
            )}
            {showErrorMessage && (
              <span className="error-message">{showErrorMessage}</span>
            )}
          </div>
        )}
        {type === "file" && (
          <div>
            {label && <label>{label}</label>}
            <input
              className="form-control"
              onChange={this.changeValue}
              type={type}
              value={getValue() || ""}
            />
            <button className="btn btn-xs btn-info fileButton">
              Select a video file
            </button>
            {showRequiredMessage && (
              <span className="error-message">Please select a file</span>
            )}
            {showErrorMessage && (
              <span className="error-message">{showErrorMessage}</span>
            )}
          </div>
        )}
        {type === "checkbox" && (
          <div style={{ width: "100%" }}>
            {label && <label>{label}</label>}
            <input
              className="form-control form-checkbox-input"
              onChange={this.changeValue}
              type={type}
              value={getValue() || ""}
            />
            <span className="form-checkbox-copy">
              I agree to SuperComedian's
              <a
                href="https://sc-assets-docs.s3.amazonaws.com/SCVideoSubmissionAgreement.pdf"
                target="_blank"
              >
                {" "}
                Submission Agreement
              </a>
            </span>
            <br />
            <br />
            {showRequiredMessage && (
              <span className="error-message">
                {label || "This field"} is required
              </span>
            )}
            {showErrorMessage && (
              <span className="error-message">{showErrorMessage}</span>
            )}
          </div>
        )}
        {type === "date" && (
          <div>
            {label && <label>{label}</label>}
            <input
              className="form-control"
              onChange={this.changeValue}
              type={type}
              name="date"
              value={getValue() || ""}
            />
            {showRequiredMessage && (
              <span className="error-message">Please select a date</span>
            )}
            {showErrorMessage && (
              <span className="error-message">{showErrorMessage}</span>
            )}
          </div>
        )}
      </div>
    );
  }
}

export default withFormsy(FormsyInput);
